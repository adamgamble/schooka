Schooka::Application.routes.draw do
  resources :sessions
  resources :accounts do
    resources :envelopes
  end
  match "login" => "sessions#new"
  match "logout" => "sessions#delete"
  root :to => "sessions#new"
end
