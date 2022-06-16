Rails.application.routes.draw do
  get "locales/switch"

  namespace :admin do
    resources :users

    root "users#index"
  end

  devise_for :users

  resources :cars do
    resources :comments
    resources :about
  end

  get "newone/index"

  resources :users do
    resource :profile
  end

  get "users/page/:page", to: "users#index", as: :users_page

  resources :events do
    resources :items
  end

  get "stats/index", as: :stats
  get "about/index", as: :about

  get "not_found", to: redirect("/", status: 302)
  get "rack", to: ->(_) { [200, {}, ["hello rack"]] }
  post "rack", to: ->(_) { [200, {}, ["hello rack with POST"]] }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  # match 'detect', to: 'home#detect', via: [:get, :post, :delete]
end
