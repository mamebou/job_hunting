Rails.application.routes.draw do
  get 'home/top'
  resources :selections
  resources :companies
  root to: 'home#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
