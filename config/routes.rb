Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'
  get '/dashboard', to: 'users#show'
  get '/discover', to: 'discover#index'
  get '/movies', to: 'movies#top_40'
  post '/movies', to: 'movies#index'
  get 'movies/:id', to: 'movies#show'

  post '/friendships', to: 'friendships#create'
  # get '/login', to: 'sessions#new'
  post '/dashboard', to: 'sessions#create'
end
