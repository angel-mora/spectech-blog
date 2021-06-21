Rails.application.routes.draw do
  # resources :votes
  resources :categories
  resources :articles do
    resource :vote, module: :articles
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
