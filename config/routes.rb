Rails.application.routes.draw do

	resources :users, only: [:new, :create, :show, :edit]

	get '/signup' => 'registrations#new'
	post '/signup' => 'registrations#create'

	root 'welcome#home'
  


end