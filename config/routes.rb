Rails.application.routes.draw do
  resources :tags
  resources :feed_categories
  resources :feeds, only: [:index, :new, :create, :show, :update] do
    resources :entries, only: [:show]
    get '/entries', to: 'entries#refresh'
  end
  resources :entries, only: [:index]
  resources :users
  resources :feed_subscriptions

  get '/feeds/:id/refresh', to: 'feeds#refresh', as: 'refresh_feed'

  #Session Routes
  root 'feeds#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
