Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :recipes
      resources :ingredients
      resources :recipe_ingredients
    end
  end

  get '*path', to: 'pages#index', via: :all
end
