Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'foods#index'
  delete 'inventory_foods/:id/destroy/:food_id', to: 'inventory_foods#destroy'
  get 'inventory_foods/:id/new', to: 'inventory_foods#new'
  post 'inventory_foods/:id/create', to: 'inventory_foods#create'
  devise_for :users
  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: %i[index new create show update edit destroy]
  resources :inventories, only: %i[index show new create destroy]
  resources :shopping_lists, only: [:index]
  # resources :recipe_foods, only: [:index]
  resources :recipe_foods, only: %i[create destroy]
  get '/public_recipes', to: 'recipes#public'
  resources :shopping_lists, only: %i[index]
  # Defines the root path route ("/")
  # root "articles#index"
end
