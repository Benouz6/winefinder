Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/search', to: 'pages#search'
  get 'recommendations/:id/map', to: 'recommendations#map', as: :map

  resources :recommendations, only: [:index, :show]
end
