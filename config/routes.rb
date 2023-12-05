Rails.application.routes.draw do
  get 'disposal_records/create'
  # Root path -> dashboard
  root to: "pages#dashboard"
  # User paths
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  # Google Vision Route
  # post '/waste_items/analyze', to: 'waste_items#analyze'
  get 'vision_analyze', to: 'visions#vision_analyze', as: "visonresult"
  post 'vision/analyze', to: 'visions#analyze'

  # Home page route
  get "home", to: "pages#home"

  # About route
  get "about", to: "pages#about"

  # User route with
  get "/search", to: "waste_items#search"
  resources :waste_items, only: %i[index show new]

  resources :user, only: %i[] do
    resources :waste_items, only: %i[new create index new]
  end

  # Disposal record route
  resources :disposal_records, only: [:create]

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
