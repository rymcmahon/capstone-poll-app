Rails.application.routes.draw do
	 devise_for :users

	 root 'politicians#index'
	 get '/politicians/new' => 'politicians#new'
	 get '/politicians/:id' => 'politicians#show'
	 post '/politicians' => 'politicians#create'
	 get '/politicians/:id/edit' => 'politicians#edit'
	 patch '/politicians/:id' => 'politicians#update'
	 delete '/politicians/:id' =>'politicians#destroy'
end
