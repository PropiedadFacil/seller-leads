Rails.application.routes.draw do
  resources :leads
  devise_for :users
  root to: 'home#index'
end
