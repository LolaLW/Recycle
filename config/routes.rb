Rails.application.routes.draw do
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users do
    resources :bookmarks, only: [:index]
  end

  resources :wastes do
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :dumpsters, only: [:index, :show]
  resources :elements
  resources :categories
  # Defines the root path route ("/")
  # root "articles#index"
end
