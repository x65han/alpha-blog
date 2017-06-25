Rails.application.routes.draw do
  root "pages#home", as: "home"
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  resources :articles
end
