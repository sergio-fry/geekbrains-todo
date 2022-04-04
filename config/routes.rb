Rails.application.routes.draw do
  get 'home2', to: 'home#index', as: :second_home
  get 'home', to: 'home#index'
  get 'home/index'

  get 'about/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
