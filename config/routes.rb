Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }
  #devise_for :views
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/history', to: 'home#history'

  resources :leave, only: [:index,:new,:create,:update] do
    
    collection do
      get :history, to: "leave#history"
      put "cancel_leave/:id", to: "leave#cancel_leave"
      put "extend_leave/:id", to: "leave#extend_leave"
    end
  end
  
  resources :registration, only: [:new,:create] do
    collection do
      post "change_role", to: "registration#change_role"
    end
  end

  # exceptions
  match "*path", to: "errors#catch_404", via: :all
end
