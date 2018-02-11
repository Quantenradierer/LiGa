Rails.application.routes.draw do
  get 'dashboard/index'

  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      post 'change_password'
    end
  end
  resources :commands
  resources :assignments, only: %i[update create]
  resources :games do
    resources :gamelogs, only: %i[show], id: /[^\/]+/
    resources :gameconfigs, only: %i[edit update]

    member do
      post 'start'
      post 'stop'
      post 'upgrade'
      post 'upgrade_lgsm'
    end
  end

  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
