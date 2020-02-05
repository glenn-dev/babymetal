Rails.application.routes.draw do
  resources :breastfeedings
  resources :babies
  
  root 'babies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
