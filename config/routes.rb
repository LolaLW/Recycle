Rails.application.routes.draw do
  get 'bookmarks/index'
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users do
    resources :bookmarks, only: [:index]
  end

  resources :wastes, except: [:show] do
    resources :bookmarks, only: [:create]
  end

  resources :dumpsters
  # Defines the root path route ("/")
  # root "articles#index"
end
