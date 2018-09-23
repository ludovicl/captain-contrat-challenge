# frozen_string_literal: true

Rails.application.routes.draw do
  get 'combat/lobby'
  post 'combat/result'
  root to: 'fighters#home'
  resources :fighters
end
