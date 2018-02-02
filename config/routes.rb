Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  get 'queries', to: 'queries#home'
  get :limbo, controller: 'queries'
  post :search, controller: 'queries'
  resources :users
  resources :recipes, only: %i[show create destroy]
  resource :dashboard, only: [:show]
end