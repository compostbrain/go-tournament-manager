Rails.application.routes.draw do
  devise_for :users

  resources :tournaments

  root to: "pages#index"
end
