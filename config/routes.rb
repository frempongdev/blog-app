Rails.application.routes.draw do
  devise_for :users
  root 'users#index', as: :authenticated_root
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: [:create]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
  get '/image.jpg', to: 'users#index'
end
