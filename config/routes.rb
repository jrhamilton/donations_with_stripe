NonProfitDonation::Application.routes.draw do
  root to: "charges#new"
  devise_for :users
  resources :companies
  resources :donations
  resources :charges
  resources :subscriptions
end
