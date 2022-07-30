Rails.application.routes.draw do
  root "campaigns#index"
  get "/campaigns", to: "campaigns#index"
  post "/campaigns", to: "campaigns#upload"
end
