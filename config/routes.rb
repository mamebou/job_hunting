Rails.application.routes.draw do
  resources :plans
  get 'home/top'
  get '/list', to: 'home#list'
  resources :selections
  resources :companies
  root to: 'home#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
