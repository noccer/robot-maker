Rails.application.routes.draw do

  root to: 'users#index'

  resources :robots
  resources :suburbs

  get '/robots' => 'robots#index'
  get '/robots/table' => 'robots#table'

  get '/robots/new' => 'robots#new'
  post '/robots/create' => 'robots#create_robot'
  get '/robots/:id/edit' => 'robots#edit'
  patch '/robots/update' => 'robots#update'
  delete '/robots/destroy' => 'robots#destroy'

  post '/robots/semi-auto' => 'robots#create_robot_semi_automatically'
  post '/robots/auto' => 'robots#create_robot_automatically'

  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new_user_form'
  post '/users' => 'users#create_user'

  get '/suburbs' => 'suburbs#index'

end
