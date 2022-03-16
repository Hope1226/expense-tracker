Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "categories#index"
  
  resources :categories, only: %i[index show new create destroy] do 
    resources :transactions, only: %i[index show new create destroy]
  end

  resources :users, only: %i[show]

  # Defines the root path route ("/")
  # root "articles#index"
end
