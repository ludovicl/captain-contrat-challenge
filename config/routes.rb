Rails.application.routes.draw do

  root to: 'fighters#home'
  resources :fighters

end
