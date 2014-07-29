Rails.application.routes.draw do

  root to: redirect('/communities/1')

  resources :communities, only: [:show]
  resources :restaurants, except: [:index]
  resources :members, except: [:index]
  resources :reviews, only: [:create, :update, :destroy]

  devise_for :members

end
