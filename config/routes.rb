Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show'
  get '/posts/:id/edit' => 'posts#edit'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'

  get 'foodies' => 'foodies#index'
  get '/foodies/:id/following' => 'followees#show' 
  get '/foodies/:id/followees' => 'followers#show'

  resources :posts do
    resources :comments
  end

  get '/signup' => 'foodies#new'
  post '/foodies' => 'foodies#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      get '/posts' => 'posts#index'
    end
  end
end