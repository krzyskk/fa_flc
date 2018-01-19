Rails.application.routes.draw do
  devise_for :users
  resources :lessons
  resources :decks do
    resources :cards
  end

	root 'decks#index'
  put 'lessons/lesson_id/next_question', to: 'lessons#next_question', as: 'next_question'

end
