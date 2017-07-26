class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]

  has_many :authorizations, dependent: :destroy
  has_one :profile, dependent: :destroy

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
 # TODO: Profile picture and username should
 def self.from_omniauth(auth, current_user)
   authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
   @a = auth
   if authorization.user.blank?
     user = current_user || User.where('email = ?', auth["info"]["email"]).first
     if user.blank?
       user = User.new
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,10]
       user.profile = Profile.new(name: auth.info.name, picture: auth.info.image, username:auth.info.nickname, bio: auth.extra.raw_info.bio, website: auth.extra.raw_info.blog)
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
