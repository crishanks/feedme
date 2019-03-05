Rails.application.routes.draw do
  resources :tags
  resources :categories
  resources :feeds, only: [:show, :index, :new, :create] do
    resources :entries, only: [:show, :index]
  end
  resources :users
  resources :feed_subscriptions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
