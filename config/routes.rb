Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :lessons
  resources :decks do
    resources :cards do
      collection { post :import }
    end
  end

	root 'decks#index'
  put 'lessons/lesson_id/next_question', to: 'lessons#next_question', as: 'next_question'

end
