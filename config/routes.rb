Rails.application.routes.draw do
  resources :room_kinds
  devise_for :users
  resources :users
  resources :landing_pages
  resources :reservations
  resources :rooms
 
  resources :hotels do
    resources :rooms, only: [:index] do 
      resources :reservations, only:[:index]
    end
  end
  resources :roles
  resources :califications
  resources :kinds
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'landing_pages#index'
  # config/routes.rb


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
