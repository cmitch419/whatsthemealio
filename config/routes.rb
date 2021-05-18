Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :recipes, param: :id
      resources :ingredients, param: :id
    end
  end

  get '*path', to: 'pages#index', via: :all
end
