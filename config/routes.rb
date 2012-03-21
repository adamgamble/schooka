Schooka::Application.routes.draw do
  resources :sessions
  resources :accounts do
    resources :envelopes do
      resources :transactions
    end
  end
  namespace :api do
    namespace :v1 do
      resources :accounts do
        resources :envelopes do
          resources :transactions do
          end
        end
      end
    end
  end
  match "login" => "sessions#new"
  match "logout" => "sessions#delete"
  root :to => "sessions#new"
end
