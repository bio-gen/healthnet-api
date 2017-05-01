Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'api/v1/users/registrations' }

  scope module: 'api' do
    namespace :v1 do
      resources :users, except: [:new, :edit]

      post 'auth' => 'user_token#create'
    end
  end
end
