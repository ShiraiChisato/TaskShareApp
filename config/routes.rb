Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'users#show'
  get 'project/show'
  get 'project/show'
  get 'task/show'

  resources :projects
  resources :associates
  resources :posts
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end