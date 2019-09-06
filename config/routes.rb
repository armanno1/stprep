Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
  get 'my_courses', to: 'courses#my_courses'
  resources :courses, :stations, :questions, :payments
  resources :user_courses, only: [:create]
  resources :station_categories, except: [:destroy]
  mount StripeEvent::Engine, at: '/stripe-event'
end
