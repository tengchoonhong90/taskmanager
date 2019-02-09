Rails.application.routes.draw do
  
	devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'tasks#index'

	get '/tasks' => 'tasks#tasks', as: 'tasks'
	get '/new' => 'tasks#new', as: 'new_task'
	get '/find/tasks' => 'tasks#find'
	post '/tasks' => 'tasks#create'
	get '/tasks/:id' => 'tasks#show' , as: 'task'
	get '/tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
	patch '/tasks/:id/' => 'tasks#update', as: 'update_task'
	delete '/tasks/:id' => 'tasks#destroy'
	get '/map' => 'tasks#map'

	get '/taskees' => 'taskees#index', as: 'taskees'
	get '/new/taskees' => 'taskees#new', as: 'new_taskee'
	get '/find/taskees' => 'taskees#find'
	post '/taskees' => 'taskees#create'
	get '/taskees/:id' => 'taskees#index' , as: 'taskee'
	get '/taskees/:id/edit' => 'taskees#edit', as: 'edit_taskee'
	patch '/taskees/:id' => 'taskees#update'
	delete '/taskees/:id' => 'taskees#destroy'
	get '/map' => 'taskees#map'

	resources :chats
    root 'chats#index'

end