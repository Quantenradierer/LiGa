Rails.application.routes.draw do
  get 'dashboard/index'

  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :game_manager_assignments, only: [:update, :create]
  resources :games do
    resources :gamelogs, only: :show, id: /[^\/]+/
    resources :gameconfigs, only: [:edit, :update], id: /[^\/]+/
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
