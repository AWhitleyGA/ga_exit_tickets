Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :instructors
  resources :programs do
    resources :lessons do
      resources :surveys
    end
    resources :memberships, only: [:create, :destroy]
    member do
      get 'manage'
    end
  end

  root to: 'programs#index'

end
