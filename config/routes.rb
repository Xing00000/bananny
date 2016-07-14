Rails.application.routes.draw do

  devise_for :users

  resources :users do
  	resources :nannies ,only: [:new]
    resources :parents ,only: [:new]
  end
  resources :nannies do
  	resources :schedules
  end
  resources :parents
  resources :infos ,only: [:create,:edit,:update]


  root "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
