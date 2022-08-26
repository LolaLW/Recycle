Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :produits, except: [:show]
  resources :collects
  devise_for :users do
    resources :favoris, only: [:index]
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
