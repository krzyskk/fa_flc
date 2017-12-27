Rails.application.routes.draw do
  resources :decks
  devise_for :users
  resources :lessons
  resources :cards
	root 'cards#index'
  put 'api/v1/lessons/next_question', to: 'api/v1/lessons#next_question'

end
