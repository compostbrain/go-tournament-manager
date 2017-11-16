Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"
  resources :tournaments, only: %i[index new create edit show update destroy] do
    collection do
      post :import
    end
    resources :rounds, only: %i[index show create destroy]
    resources :players, only: %i[index update destroy]
  end
  resources :rounds do
    resources :players do
      post :pair, on: :collection
    end
    resources :games
  end
  resources :players do
    member do
      get :round_status
    end
    resources :games
  end
  resources :games do
  end

  resources :tournament_registrations, only: %i[create update]

  get "tournaments/:tournament_id/standings",
  to: "standings#index", as: :tournament_standings
end
