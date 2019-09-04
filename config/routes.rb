Rails.application.routes.draw do
  authenticate :user do
    resources :courses, except: [:index, :show]
    resources :stations
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
  resources :courses, :stations
  resources :user_courses, only: [:create]
  get 'my_courses', to: 'courses#my_courses'
  resources :payments
  mount StripeEvent::Engine, at: '/stripe-event'
end
