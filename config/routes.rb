Rails.application.routes.draw do
  get 'users/show'

  root 'welcome#index'
  get '/howitworks', to: 'welcome#how_it_works'

  devise_for :users

  resources :users, only: :show
end
