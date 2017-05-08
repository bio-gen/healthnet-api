Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :users, except: [:new, :edit] do
        resources :work_experiences, only: [:create, :update, :destroy]
      end

      post 'auth' => 'user_token#create'
    end
  end
end
