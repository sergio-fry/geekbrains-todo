Rails.application.routes.draw do
  resources :users
  resources :events


  # stats#show
  resource :stats, only: :show

  get 'stats/index'
  get 'about/index'

  get 'not_found', to: redirect('/', status: 302)
  get 'rack', to: ->(_) { [200, {}, ["hello rack"]] }
  post 'rack', to: ->(_) { [200, {}, ["hello rack with POST"]] }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  # match 'detect', to: 'home#detect', via: [:get, :post, :delete]
end
