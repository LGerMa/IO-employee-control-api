Rails.application.routes.draw do
  #use_doorkeeper
  devise_for :users, skip: [:sessions, :password, :registrations]
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications, :authorizations
  end
  namespace :api do
    namespace :v1 do
    end
  end
end
