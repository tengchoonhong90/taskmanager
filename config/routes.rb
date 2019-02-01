Rails.application.routes.draw do
	devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'tasks#index'

	get '/tasks' => 'tasks#index', as: 'tasks'
	get '/new/tasks' => 'tasks#new', as: 'new_task'
	get '/find/tasks' => 'tasks#find'
	post '/tasks' => 'tasks#create'
	get '/tasks/:id' => 'tasks#show' , as: 'task'
	get '/tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
	patch '/tasks/:id' => 'tasks#update'
	delete '/tasks/:id' => 'tasks#destroy'
	get '/map' => 'tasks#map'

end