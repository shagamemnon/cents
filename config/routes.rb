Rails.application.routes.draw do
  root 'welcome#index'
  get '/howitworks', to: 'welcome#how_it_works'
end
