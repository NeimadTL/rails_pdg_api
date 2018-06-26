Rails.application.routes.draw do

  resources :workers, only: [:index]

end
