Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :users, only:[:index]
  resources :products do
    resources :reviews
  end
  post '/session', to: 'users#user_session'
end
