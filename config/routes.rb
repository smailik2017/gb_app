Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :posts
  
  devise_for :users
  resource :profiles, only: [:edit, :update, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
