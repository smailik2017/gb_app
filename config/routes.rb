Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  root 'home#index'
  resources :posts do 
    collection do 
      get :search
      get :autocomplete
    end
  end
  
  # namespace :api do
  #   namespace :v1 do
  #     resources :comments, only: [:index, :show, :create, :destroy]
  #   end
  # end

  devise_for :users
  resource :profiles, only: [:edit, :update, :show]

  resource :likes, only: [:create]
end
