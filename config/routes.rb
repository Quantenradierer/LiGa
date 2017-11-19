Rails.application.routes.draw do
  get 'dashboard/index'

  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :games do
    resources :gamelogs, only: :show
    member do
      post 'start'
      post 'stop'
    end
  end

  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
