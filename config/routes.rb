Rails.application.routes.draw do

  resources :workers, only: [:index, :create]
  resources :shifts, only: [:index]

end
