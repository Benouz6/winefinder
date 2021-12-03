Rails.application.routes.draw do
  root to: 'pages#home'

  get 'pages/search', to: 'pages#search'
  get 'pages/article', to: 'pages#article'

  get 'recommendations/:id/map', to: 'recommendations#map', as: :map

  resources :recommendations, only: [:index, :show]
end
