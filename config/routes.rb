Rails.application.routes.draw do

  root 'application#hello'
  get '/about' ,to: 'static_pages#about'

end
