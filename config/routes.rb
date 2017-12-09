Rails.application.routes.draw do
  resources :lessons
  resources :cards
	root 'cards#index'
end
