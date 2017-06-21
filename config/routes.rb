Rails.application.routes.draw do
  root "pages#index", as: "home"
  get '/about', to: 'pages#about'
end
