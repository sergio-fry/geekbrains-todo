Rails.application.routes.draw do
  devise_for :users

  resources :cars do
    resources :comments
    resources :about
  end


  get 'newone/index'


  resources :users do
    resource :profile
  end

  get 'users/page/:page', to: 'users#index'

  resources :events do
    resources :items
  end

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
