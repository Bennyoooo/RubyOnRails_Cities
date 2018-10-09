Rails.application.routes.draw do
  root "main#index"
  get '/cities/view', to: 'main#view'
  get '/cities/new' , to: 'main#new'
  get '/cities/create', to: 'main#createcity'
  get '/cities/update', to: 'main#update'
  post '/cities/create', to: 'main#create'
  get '/cities/update', to: 'main#update'
  post '/cities/update1', to: 'main#update1'
end
