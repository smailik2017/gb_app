Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :posts
  
  # namespace :api do
  #   namespace :v1 do
  #     resources :comments, only: [:index, :show, :create, :destroy]
  #   end
  # end

  devise_for :users
  resource :profiles, only: [:edit, :update, :show]

  resource :likes, only: [:create]
end
