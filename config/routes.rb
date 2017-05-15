Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :users do
        resources :work_experiences
        resources :educations
      end

      post 'auth' => 'user_token#create'
    end
  end
end
