Rails.application.routes.draw do
  devise_for :stores
  devise_for :users
  root'records#new'
  resources :records
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
