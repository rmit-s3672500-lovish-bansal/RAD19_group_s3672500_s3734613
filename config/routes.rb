Rails.application.routes.draw do
  
  get 'register', to:'register#index'
  # get 'course', to:'course#index'
  # get 'courses', to:'course#show'
  get 'contact', to:'contact_us#index'  
  get 'category',to:'category#index'
  root 'home#index'
  get 'signup', to: 'users#new'
  post 'signup',  to: 'users#create'
  resources :users
  resources :course
  
end
