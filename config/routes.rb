Rails.application.routes.draw do
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", registration: "signup" }, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  # devise_scope :user do
  #   post "/refresh_token", to: "users/sessions#refresh_token"
  # end
  
  get "/current_user", to: "current_user#logged_in_user"
  get "/users", to: "current_user#index"

  namespace :api do
    namespace :v1 do
      resources :products
      get "/ui_meta_data", to: "ui_meta_data#meta_data"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
