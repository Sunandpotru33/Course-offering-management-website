Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index', as: :authenticated_root

  authenticated :user do
    case current_user.role
    when 'student'
      get 'my_courses', to: 'students#my_courses', as: :my_courses
      resources :courses, only: [:index, :show] do
        member do
          post 'enroll'
        end
      end
    when 'instructor'
      get 'my_courses', to: 'instructors#my_courses', as: :my_courses
      namespace :instructor do
        resources :courses, only: [:index, :show] # Add other actions as needed
      end
    when 'admin'
      get 'my_courses', to: 'admin#my_courses', as: :my_courses
      namespace :admin do
        resources :courses, only: [:index, :new, :create] # Add other actions as needed
        resources :users, only: [:index, :new, :create] # Add other actions as needed
      end
    end
  end

  root 'dashboard#index', as: :authenticated_root

  # Additional routes for instructors and admin

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
