Rails.application.routes.draw do
  devise_for :users
  resources :lessons
  resources :decks do
    resources :cards do
      collection { post :import }
    end
  end
	root 'decks#index'

  put 'api/v1/lessons/next_question', to: 'api/v1/lessons#next_question'
end
