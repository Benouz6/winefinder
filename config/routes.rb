Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/search', to: 'pages#search'

  resources :recommendations, only: :index
end
