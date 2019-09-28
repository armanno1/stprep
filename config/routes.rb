Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
  get 'my_courses', to: 'courses#my_courses'
  resources :courses, :stations, :questions, :station_categories, :payments
  resources :user_courses, only: [:create]
  authenticate :user do
    resources :courses, :except => [:show, :index]
    resources :stations, :questions, :station_categories
  end
  mount StripeEvent::Engine, at: '/stripe-event'
  resources :stations do
    put :complete, on: :member
  end
end
