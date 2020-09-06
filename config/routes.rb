Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  get 'posts', to: 'posts#index'
  resources :items, only: [:new, :index, :create, :show]
  get 'items', to: 'items#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
