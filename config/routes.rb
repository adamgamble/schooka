Schooka::Application.routes.draw do
  resources :sessions
  resources :budgets
  resources :accounts
  match "login" => "sessions#new"
  match "logout" => "sessions#delete"
  root :to => "sessions#new"
end
