Rails.application.routes.draw do

  devise_for :users

  resources :users do
  	resources :nannies ,only: [:new]
    resources :parents ,only: [:new]
  end
  resources :nannies do
  	resources :schedules
    resources :cases ,only: [:create]
    member do
      get  :data
    end
  end
  resources :cases

  resources :infos ,only: [:create,:edit,:update]
  resources :parents do
    resources :children ,only: [:new]
  end
  resources :children ,only: [:create,:update,:edit]

  match ":nanny_id/schedules", :to => "schedules#db_action", :as => "db_action", :via => "get"
  match "case/:case_id", :to => "schedules#booking", :as => "booking", :via => "patch"

  root "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
