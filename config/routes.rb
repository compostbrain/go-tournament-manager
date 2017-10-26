Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"
  resources :tournaments do
  end

  resources :tournaments, only: %i[index new create edit show update destroy] do
    resources :rounds, only: %i[index show create destroy] do
      resources :games, only: %i[index create destoy]
    end
    resources :players, only: %i[index create update destroy]
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
  end

  resources :games do
  end
end
