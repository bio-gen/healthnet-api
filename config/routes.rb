Rails.application.routes.draw do
  devise_for :users

  namespace :api, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1 do
      resources :users, except: [:new, :edit]
    end
  end
end
