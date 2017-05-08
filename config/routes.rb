Rails.application.routes.draw do
  resources :leads
  devise_for :users,
             controllers: {
               omniauth_callbacks: 'users/omniauth_callbacks',
               registrations: 'users/registrations'
             }

  root to: 'home#index'

  resource :wizard do
    Wizard::Lead::STEPS.each do |step|
      get step.to_sym
    end
    post :validate_step
  end
end
