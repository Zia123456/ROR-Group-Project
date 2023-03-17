Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'foods#index'
  devise_for :users
  resources :foods, only: %i[index new create destroy]
  resources :recipes, only: [:index, :new, :create, :show, :update, :edit, :destroy]
  resources :inventories, only: [:index]
  resources :shopping_lists, only: [:index]
  resources :recipe_foods, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
end
