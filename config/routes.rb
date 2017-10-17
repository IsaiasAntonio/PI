Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
  	registrations: 'devise/registration_custom'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
      resources :campus_locations
      resources :dependences
      resources :movement_tags
      resources :ticket_states
      resources :user_roles
  	end
  end
end
