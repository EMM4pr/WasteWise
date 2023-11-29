Rails.application.routes.draw do

  root to: "pages#dashboard"
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Dashboard
  get "about", to: "pages#about"
  # User route with
  resources :waste_items, only: %i[index show new]

  resources :user, only: %i[] do
    resources :waste_items, only: %i[new create index new]
  end

end
