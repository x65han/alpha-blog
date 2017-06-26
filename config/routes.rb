Rails.application.routes.draw do
  root "pages#home", as: "home"
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'users', to: 'users#create'
  resources :users, except: [:new]
  resources :articles
end
