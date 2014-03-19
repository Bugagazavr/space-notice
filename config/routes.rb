SpaceNotice::Application.routes.draw do
  get "/auth/github/callback" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :projects, only: [:create, :destroy] do
    resources :notification_types, only: [:create, :destroy]
  end

  get "/subscribe/:token" => "subscriptions#new", as: :subscribe

  root "home#show"
end
