Rails.application.routes.draw do
  resources :leads
  devise_for :users
  root to: 'home#index'

  resource :wizard do
    Wizard::Lead::STEPS.each do |step|
      get step.to_sym
    end
    post :validate_step
  end
end
