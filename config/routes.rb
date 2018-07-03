Rails.application.routes.draw do

  resources :workers, only: [:index, :create, :update]
  resources :shifts, only: [:index, :create]

end
