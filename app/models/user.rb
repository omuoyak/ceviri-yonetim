class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github, :google_oauth2]

  has_many :authorizations, dependent: :destroy

  # Create session
 def self.new_with_session(params,session)
   if session["devise.user_attributes"]
     new(session["devise.user_attributes"],without_protection: true) do |user|
       user.attributes = params
       user.valid?
     end
   else
     super
   end
 end

 # Omniauth authorize or create user
 def self.from_omniauth(auth, current_user)
   authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
   if authorization.user.blank?
     user = current_user || User.where('email = ?', auth["info"]["email"]).first
     if user.blank?
       user = User.new
       user.password = Devise.friendly_token[0,10]
       user.name = auth.info.name
       user.email = auth.info.email
       user.save
     end
     authorization.user_id = user.id
     authorization.save
   end
   authorization.user
 end

 private
  def password_required?
    self.authorizations.size < 1 && super
  end

end
