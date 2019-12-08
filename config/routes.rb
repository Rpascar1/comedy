Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"
  }
  root to: 'pages#home'
  #get 'all_shows', to: 'pages#all_shows'

  resources :users
  resources :shows
  
  resources :clubs do
    resources :shows
  end

  resources :jokes





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
