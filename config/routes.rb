Rails.application.routes.draw do

  get '/signin' => 'sessions#new'

  post '/signin' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

	resources :users, only: [:new, :create, :show, :update]
	resources :attractions, only: [:show, :index, :new, :create, :edit, :update]

	# resources :sessions, only: [:new, :create]

	# get '/signup' => 'registrations#new'
	# post '/signup' => 'registrations#create'

	root 'welcome#home'
  


end