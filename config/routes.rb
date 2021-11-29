Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/search', to: 'pages#search'
  get '/map', to: 'recommendations#map'
  get 'pages/article', to: 'pages#article'

  resources :recommendations, only: [:index, :show]
end
