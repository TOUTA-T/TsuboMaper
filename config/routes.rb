Rails.application.routes.draw do
  root'records#new'
  resources :records
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
