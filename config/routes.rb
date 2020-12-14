Rails.application.routes.draw do
  get 'records/new'
  root'records#new'
  resource :records
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
