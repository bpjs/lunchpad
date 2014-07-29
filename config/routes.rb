Rails.application.routes.draw do

  root 'communities/1/show'

  resources :communities, only: [:show]
  resources :restaurants, except: [:index]
  resources :members, except: [:index]
  resources :reviews, only: [:create, :update, :destroy]

  devise_for :members

end
