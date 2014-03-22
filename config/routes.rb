SpaceNotice::Application.routes.draw do
  get "/auth/github/callback" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :projects, only: [:create, :destroy] do
    resources :notification_types, only: [:create, :destroy]
  end

  get "/subscribe/:token" => "subscriptions#new", as: :subscribe

  post "/v1/pushPackages/web.com.spacenotice" => "push_packages#show"
  post "/v1/log" => "push_packages#log"  
  post "/v1/devices/:token/registrations/web.com.spacenotice" => "push_packages#subscribe"
  delete "/v1/devices/:token/registrations/web.com.spacenotice" => "push_packages#unsubscribe"
  get "push" => "home#show"

  root "home#show"
end
