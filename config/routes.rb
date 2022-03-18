Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root to: "home#index"
  
  resources :categories do 
    resources :transactions
  end

  resources :users, only: %i[show]
  resources :home, only: %i[index]

  delete '/transactions', to: 'transactions#destroy_all'

  # Defines the root path route ("/")
  # root "articles#index"
end
