Rails.application.routes.draw do
  resources :tags
  resources :feed_categories
  resources :feeds, only: [:index, :new, :create, :show] do
    resources :entries, only: [:index, :show]
  end
  resources :users
  resources :feed_subscriptions

  #Session Routes
  root 'sessions#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
