SpaceNotice::Application.routes.draw do
  get "/auth/github/callback" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :projects, only: [:create, :destroy] do
    resources :notification_types, only: [:create, :destroy]
  end

  get "/subscribe/:token" => "subscriptions#new", as: :subscribe

  post "/v1/pushPackages/web.com.spacenotice" => "push_packages#show"

  root "home#show"
end
