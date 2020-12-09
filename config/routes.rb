Rails.application.routes.draw do
  devise_for :users

  resources :tips

  get 'welcome/index'

  root 'welcome#index'
end
