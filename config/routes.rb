Rails.application.routes.draw do
  get 'events/index'
  get 'events', to: 'events#search', query: 'Moscow'
  get 'events/:query', to: 'events#search'

  get 'about/index'

  get 'not_found', to: redirect('/', status: 302)
  get 'rack', to: ->(_) { [200, {}, ["hello rack"]] }
  post 'rack', to: ->(_) { [200, {}, ["hello rack with POST"]] }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
