Rails.application.routes.draw do
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  resources :user
  resources :gossips
  resources :city
  resources :comment
  resources :sessions
  resources :like
end
