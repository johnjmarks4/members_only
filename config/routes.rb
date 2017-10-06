Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'sessions/new'

  get 'sessions/create'

  get 'sign-in/' => "sessions#new"

  post 'users/' => "users#create"

  get '/profile' => "sessions#profile"

  post '/profile' => "sessions#profile"

  get '/logout', to: 'sessions#destroy'

  delete '/logout',  to: 'sessions#destroy'

  resources :posts, :only => [:new, :create, :index]

  root "sessions#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
