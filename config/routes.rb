Rails.application.routes.draw do
  devise_for :users
  
  root 'static_pages#index'
  post :search, controller: 'static_pages'
  resources :recipes
end
