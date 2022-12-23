Rails.application.routes.draw do
  resources :contributions
  resources :contributors
  resources :committees
  resources :campaign_treasurers
  resources :campaigns do
    resources :campaign_reports do
      resources :campaign_schedule_as
      resources :campaign_schedule_a1s
      resources :campaign_schedule_bs
      resources :campaign_schedule_cs
      resources :campaign_schedule_ds
      resources :campaign_schedule_fs
    end
    member do
      get 'contact'
    end
  end
  resources :elections
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "campaigns#index"
end
