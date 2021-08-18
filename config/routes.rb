Rails.application.routes.draw do
  devise_for :logins, controllers: {
    session: 'logins/sessions',
    registrations: 'logins/registrations'
    }
  root 'mypage#show'
  get 'manage/show'
  get 'view/show'
  get 'task/show'
  get 'mypage/show'
  resources :Users
  resources :logins
  resources :Projects
  resources :Associates
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
