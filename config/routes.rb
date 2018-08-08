# frozen_string_literal: true

Rails.application.routes.draw do
  # RESTful routes
  # resources :forecasts, except: %i[new edit]
  # resources :coordinates
  resources :locations, except: %i[new edit]
  resources :examples, except: %i[new edit]
  resources :users, only: %i[index show update]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
  get '/forecasts' => 'forecasts#index'
  get '/coordinates' => 'coordinates#index'
end
