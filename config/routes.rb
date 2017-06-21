Rails.application.routes.draw do
  root "pages#home", as: "home"
  get '/about', to: 'pages#about'

  resources :articles
end
