Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  root to: "pages#home"
  # hompage
  resources :users
  resources :shows
  resources :jokes
  # necessary routes
  resources :clubs do
    resources :shows
  end
  # nested route shows/clubs use clubs and cities on home page to demonstrate
  # example - http://localhost:3000/clubs/1/shows

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
