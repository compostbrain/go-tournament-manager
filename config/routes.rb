Rails.application.routes.draw do
  resources :tournaments
  devise_for :users
  root to: "pages#index"
end
