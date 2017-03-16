Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'api/v1/users/registrations' }

  scope module: 'api' do
    namespace :v1 do
      post 'auth', to: 'authentication#authenticate_user'

      resources :users, except: [:new, :edit]
    end
  end
end
