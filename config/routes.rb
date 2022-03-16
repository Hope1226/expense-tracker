Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "categories#index"
  
  resources :categories do 
    resources :transactions
  end

  resources :users, only: %i[show]

  # Defines the root path route ("/")
  # root "articles#index"
end
