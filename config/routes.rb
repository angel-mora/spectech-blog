Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :sessions, only: %w[index create destroy]
  resources :categories, only: %[show] 
  resources :articles do
    resource :vote, only: %w[create destroy]
  end
  resources :users
end
