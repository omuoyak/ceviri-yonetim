Rails.application.routes.draw do
  resources :translations
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks"}, :skip => [:registrations]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
