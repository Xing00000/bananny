Rails.application.routes.draw do

  devise_for :users

  resources :users do
  	resources :nannies ,only: [:new]
    resources :parents ,only: [:new]
  end
  resources :nannies do
  	resources :schedules
    resources :cases ,only: [:create]
  end
  resources :cases

  resources :infos ,only: [:create,:edit,:update]
  resources :parents do
    resources :children ,only: [:new]
  end
  resources :children ,only: [:create,:update,:edit]

  root "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
