Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'accounts#index'

  resources :accounts do
    resources :envelopes do
      resources :transactions
    end
  end
end
