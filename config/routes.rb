Rails.application.routes.draw do
  root 'mypage#show'
  get 'manage/show'
  get 'view/show'
  get 'task/show'
  get 'mypage/show'
  devise_for :logins, controllers: {
    session: 'logins/sessions',
  }
  resources :logins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
