Rails.application.routes.draw do
  get 'posts/new'

  get 'posts/create'

  get 'users/new'

  get 'users/create'

  get 'sessions/new'

  get 'sessions/create'

  get 'sign-in/' => "sessions#new"

  post 'users/' => "users#create"

  get '/profile' => "sessions#profile"

  post '/profile' => "sessions#profile"

  get '/logout', to: 'sessions#destroy'

  post '/posts/create' => 'posts#create'

  get '/posts/create' => 'posts#create'

  delete '/logout',  to: 'sessions#destroy'

  get 'posts/index' => 'posts#index'

  resources :posts, :only => [:new, :create, :index]

  root "posts#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
