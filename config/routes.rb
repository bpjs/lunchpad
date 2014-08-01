Rails.application.routes.draw do

  root to: redirect('communities/1')
  devise_for :members

  resources :communities, only: [:show] do
    resources :groups, only: [:index, :create]
  end

  resources :groups, only: [:destroy]

  resources :restaurants, only: [:show, :create, :destroy]
  resources :members, except: [:index]
  resources :reviews, only: [:create, :edit, :update, :destroy]

  post "/members/:id/join_group/:group_id", to: "members#join_group", as: "member_join_group"
  post "/members/:id/leave_group/:group_id", to: "members#leave_group", as: "member_leave_group"

  get "yelp_call", to: "restaurants#yelp_call"
end
