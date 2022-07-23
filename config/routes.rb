Rails.application.routes.draw do
  resources :campaign_schedule_fs
  resources :campaign_schedule_ds
  resources :campaign_schedule_cs
  resources :campaign_schedule_bs
  resources :campaign_schedule_as
  resources :campaign_treasurers
  resources :campaign_reports
  resources :campaigns
  resources :elections
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "elections#index"
end
