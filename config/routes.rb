Rails.application.routes.draw do
  root to: 'pages#home'

  resources :recommendations, only: :index
end
