Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users, shallow: true do
    resources :projects do
      resources :investments
    end
  end

  resources :charities do
    resources :projects, shallow: true
  end

  get '/howitworks', to: 'welcome#how_it_works'
  get '/explore', to: 'projects#index'
end
