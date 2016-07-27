Rails.application.routes.draw do

  devise_for :users
  # :constraints => { subdomain: 'api' }
  scope :path => '/api/v1/', :module => 'api_v1', :as => 'v1', :defaults => { :format => :json } do
    # resources :users, only: [:show] # for testing purposes only
    post 'user' => 'users#user'
    get 'search_nannies' => 'nannies#search'

    get 'build' => 'cases#build'
    post 'cancel' => 'cases#cancel'
    post 'reload' => 'cases#reload'
    get 'message' => 'cases#message'
    post 'book' => 'cases#book'

    post 'rating' => 'ratings#rating'


  end

  resources :users do
    with_options only: :new do |new_only|
      new_only.resources :nannies, :parents
    end
    get :registered, :on => :member
  end

  resources :nannies do
  	resources :schedules
    resources :cases, only: [:create]
    member do
      get  :data
    end
  end
  resources :cases do
    resources :comments,only: [:create,:update]
  end
  resources :infos ,only: [:create,:edit,:update]
  resources :parents do
    resources :children ,only: [:new]
  end
  resources :children ,only: [:create,:update,:edit]

  get ":nanny_id/schedules", :to => "schedules#db_action", :as => "db_action"
  patch "case/:case_id", :to => "schedules#booking", :as => "booking"

  root "users#index"
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
