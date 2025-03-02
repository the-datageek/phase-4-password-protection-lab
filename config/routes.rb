Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/signup', to: 'signup#create'
  get '/me', to: 'signup#show'
  post '/login', to: 'login#create'
  delete '/logout', to: 'logout#destroy'
end
