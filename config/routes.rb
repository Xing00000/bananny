Rails.application.routes.draw do

  devise_for :users

  resources :users do
  	resources :nannies
  end
  resources :nannies do
  	resources :schedules
  end
  resources :infos ,only: [:edit,:update]


  root "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
