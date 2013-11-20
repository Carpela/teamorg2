Teamorg2::Application.routes.draw do
  resources :teams
  resources :players
  resources :games do
    member do
      post 'send_invites'
      post 'send_chasing_up'
      post 'add_from_group'
    end
    resources :players do
      collection do
        get 'gmail'
      end
    end

    resources :game_players do
      get 'change_status'
    end
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :groups do
    member do
      post 'add_player'
    end
  end
end