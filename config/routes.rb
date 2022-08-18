Rails.application.routes.draw do
  resources :campaign_treasurers
  resources :campaigns do
    resources :campaign_reports do
      resources :campaign_schedule_as
      resources :campaign_schedule_bs
      resources :campaign_schedule_cs
      resources :campaign_schedule_ds
      resources :campaign_schedule_fs
    end
  end
  resources :elections
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :leftnav

  # Defines the root path route ("/")
  root "elections#index"
end
