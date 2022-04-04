Rails.application.routes.draw do
  get 'events/index'

  get 'about/index'

  get 'not_found', to: redirect('/', status: 302)
  get 'rack', to: ->(_) { [200, {}, ["hello rack"]] }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
