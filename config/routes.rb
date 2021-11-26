Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/search', to: 'pages#search'
  get '/map', to: 'recommendations#map'

  resources :recommendations, only: [:index, :show]
end
