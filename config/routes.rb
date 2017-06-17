Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: :registrations }

  devise_scope :user do
    get '/account', to: 'registrations#show', as: 'account'
  end

  resources :instructors
  resources :programs, param: :name do
    resources :lessons, param: :number do
      resources :surveys
    end
    resources :memberships, only: [:create, :destroy]
    member do
      get 'manage'
    end
  end

  root to: 'programs#index'

end
