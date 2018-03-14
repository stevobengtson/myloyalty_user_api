Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resource :tokens, only: [:create] do
        get 'authorized'
      end
      resources :users
    end
  end
end
