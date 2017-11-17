Rails.application.routes.draw do
  get 'dashboard/index'

  resources :games do
    member do
      post 'start'
      post 'stop'
    end
  end

  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
