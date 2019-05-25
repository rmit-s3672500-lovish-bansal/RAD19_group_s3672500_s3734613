Rails.application.routes.draw do
  
  get 'register', to:'register#index'
  get 'course', to:'course#index'
  get 'contact', to:'contact_us#index'  
  get 'category',to:'category#index'
  root 'home#index'
  
end
