Rails.application.routes.draw do
  #use_doorkeeper
  devise_for :users, skip: [:sessions, :password, :registrations]
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications, :authorizations
  end
  namespace :api do
    namespace :v1 do
      resources :labor_times
      post '/labor_times/finish',
           to: 'labor_times#finish_labor_time'
      get '/users/me', to: 'users#me'
    end
  end
end
