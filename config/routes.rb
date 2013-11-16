Teamorg2::Application.routes.draw do
  resources :teams

  resources :games do
    member do
      post 'send_invites'
    end
    resources :players
    resources :game_players
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end