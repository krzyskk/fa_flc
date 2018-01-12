Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :lessons
  resources :decks do
    resources :cards
    member do
      post :import
    end
  end

	root 'decks#index'

  put 'api/v1/lessons/next_question', to: 'api/v1/lessons#next_question'
  get '/settings', to: 'users#show'


end
