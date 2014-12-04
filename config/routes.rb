Rails.application.routes.draw do

  root to: 'users#home'
  get 'api/home' => 'api/users#home'
  get '/undetermined' => 'predictions#undetermined'
  post '/judgments' => 'judgments#create'

  resource :session, only: [:create, :destroy, :new]

  resources :users, only: [:create, :new, :show]
  resources :predictions, only: [:index, :new, :create, :show]
  resources :wagers, only: [:create]

  namespace :api, defaults: { format: :json } do
    resources :predictions, only: [:index, :show]
  end
end
