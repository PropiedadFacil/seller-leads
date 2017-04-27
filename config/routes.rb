Rails.application.routes.draw do
  resources :leads
  devise_for :users
  root to: 'home#index'

  get '/start' => 'wizard#start'
  get '/locate' => 'wizard#locate'
end
