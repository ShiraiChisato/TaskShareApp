Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'users#show'
  get 'projects/show'
  get 'projects/new'
  get 'projects/edit'
  get 'task/show'

  resources :projects do
    member do
      post :join
    end
  end
  resources :associates
  resources :posts
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end