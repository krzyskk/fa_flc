Rails.application.routes.draw do
  resources :decks
  devise_for :users
  resources :lessons
  resources :cards
	root 'cards#index'
end
