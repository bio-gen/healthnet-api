Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'api/v1/users/registrations' }

  namespace :api, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1 do
      post 'auth_user', to: 'authentication#authenticate_user'

      resources :users, except: [:new, :edit]
    end
  end
end
