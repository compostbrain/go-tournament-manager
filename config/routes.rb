Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"
  resources :tournaments, only: %i[index new create edit show update destroy] do
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
<<<<<<< HEAD

  patch "/tournaments/:tournament_id/players",
  to: "tournament_registrations#create", as: :tournament_registration
=======
>>>>>>> standings controller
  get "tournaments/:tournament_id/standings",
  to: "standings#index", as: :tournament_standings
end
