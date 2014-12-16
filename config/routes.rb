Rails.application.routes.draw do
  get 'users/show'

  root 'welcome#index'
  get '/howitworks', to: 'welcome#how_it_works'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :users, only: :show
end
