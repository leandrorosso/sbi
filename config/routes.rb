Rails.application.routes.draw do
  root to: "companies#index"

  constraints subdomain: /.*/ do
    resources :branches
  end
  resources :companies
end
