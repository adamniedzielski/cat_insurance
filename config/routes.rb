# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources "insurances", only: %i[index show] do
    resources :subscriptions, only: [:create]
  end

  namespace :admin do
    resources :insurances
    resources :claims, only: %i[index edit update]
    resources :discount_codes, only: %i[index new create]
    resources :subscriptions, only: %i[index]
  end

  namespace :api do
    resources :insurances, only: [:index]
  end

  resources :companies

  resources :subscriptions, only: %i[index] do
    resources :claims, only: %i[new create]
  end

  resources :claims, only: [:index]

  resources :vets, only: %i[index update show] do
    resources :scheduled_appointments, only: [:create]
    resources :prescriptions, only: %i[new create]
  end

  get "payments/validate_payment"

  get "payments/success"
  get "payments/error"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "insurances#index"
end
