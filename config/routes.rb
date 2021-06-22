Rails.application.routes.draw do
  root to: 'articles#index'
  resources :sessions, only: %w[index create destroy]
  # resources :votes
  resources :categories
  resources :articles do
    resource :vote, only: %w[create destroy]
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
