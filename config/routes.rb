Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'
  get '/dashboard', to: 'users#show', as: :dashboard
  get '/discover', to: 'discover#index', as: :discover # => will allow use of discover_path
  get '/movies', to: 'movies#top_40'
  post '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'

  get '/viewing-party/new', to: 'party#new'
  post '/viewing-party', to: 'party#create'

  post '/friendships', to: 'friendships#create'
  get '/login', to: 'sessions#new'
  post '/dashboard', to: 'sessions#create', as: :dashboard
end
