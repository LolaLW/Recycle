Rails.application.routes.draw do
  get 'pickups/new'
  get 'pickups/create'
  get 'pickups/update'
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard', as: :dashboard

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :wastes do
    resources :bookmarks, only: [:destroy, :create]
    # member do
    #   post 'saving_bookmark'
    # end
  end
  resources :users, only: [:update]
  resources :dumpsters, only: [:index, :show]
  resources :elements
  resources :categories

  resources :users do
    resources :bookmarks, only: [:index]
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
