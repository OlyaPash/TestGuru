Rails.application.routes.draw do
  root 'tests#index'

  get 'about' => 'about#about'
  get 'about/author' => 'about#author'
  # get 'about/about'
  # get 'about/author'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
