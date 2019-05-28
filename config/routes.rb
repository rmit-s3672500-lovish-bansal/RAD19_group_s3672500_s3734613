Rails.application.routes.draw do
  
 

 root 'home#index'
  get 'register', to:'register#index'
  get 'contact', to:'contact_us#index'  
  # get 'category',to:'category#index'
  
  get 'signup', to: 'users#new'
  post 'signup',  to: 'users#create'
  
  
  get 'login',   to: 'sessions#new'
  post 'login',   to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
  
  get 'coordinator', to: 'coordinator#show'
  
 match "/404", :to => "errors#not_found", :via => :all
match "/500", :to => "errors#internal_server_error", :via => :all
  
  resources :users
  resources :courses
  resources :categories, except: :index
  resources :locations, except: :index
  
end