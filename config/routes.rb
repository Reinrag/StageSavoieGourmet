Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  
  get 'signup', to: "users#new"
  
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  
  resources :users, except: [:new] do
    member do
      get 'confirm'
    end
  end
end
