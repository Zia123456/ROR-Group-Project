Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'foods#index'
  resources :recipes, only: [:index]
  resources :inventories, only: [:index]
  resources :shopping_lists, only: [:index]
  resources :recipe_foods, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
end
