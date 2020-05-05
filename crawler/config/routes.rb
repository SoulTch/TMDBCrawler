Rails.application.routes.draw do
	get '/' => 'index#index'
	get '/movie' 		=> 'index#movie'
	get '/movie/:id' 	=> 'index#movie'
	get '/people' 		=> 'index#person'
	get '/people/:id' 	=> 'index#person'
	get '/tv' 			=> 'index#tv'
	get '/tv/:id' 		=> 'index#tv'
	get '/tv/:id/season/:season' => 'index#season'
	get '/tv/:id/season/:season/episode/:episode' => 'index#episode'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
