Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
  get 'my_courses', to: 'courses#my_courses'
  resources :courses, :stations, :questions, :payments, :station_categories
  resources :user_courses, only: [:create]
  mount StripeEvent::Engine, at: '/stripe-event'
end
