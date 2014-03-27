SpaceNotice::Application.routes.draw do
  get "/auth/github/callback" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :projects, only: [:create, :update, :destroy] do
    resources :notification_types, only: [:create, :destroy]
  end

  get "/s/:token" => "projects#subscribe", as: :subscription
  delete "/s/:token" => "projects#unsubscribe"
  post "/p/:token" => "notifications#create", as: :notifications

  post "/v1/pushPackages/web.com.spacenotice" => "push_api#package"
  post "/v1/log" => "push_api#log"
  post "/v1/devices/:token/registrations/web.com.spacenotice" => "push_api#subscribe"
  delete "/v1/devices/:token/registrations/web.com.spacenotice" => "push_api#unsubscribe"

  root "home#show"
end
