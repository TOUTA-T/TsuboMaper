Rails.application.routes.draw do
  devise_for :stores
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: "users/passwords"
  }
  root'records#new'
  resources :records do
    collection do
      get :storetop
      post :storetop
    end
    member do
      get :before_treatment
      get :during_treatment
      patch :during_treatment, to: 'records#update'
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
end
