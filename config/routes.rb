Rails.application.routes.draw do

  root to: redirect('communities/1')
  devise_for :members

  resources :communities, only: [:show]
  resources :restaurants, except: [:index]
  resources :members, except: [:index]
  resources :reviews, only: [:create, :edit, :update, :destroy]

  get "yelp_call", to: "restaurants#yelp_call"
end
