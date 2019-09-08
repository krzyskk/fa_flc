Rails.application.routes.draw do
  namespace :admin do
      resources :activities

      resources :cards
      resources :days
      resources :habits
      resources :notes
      resources :answers
      resources :decks
      resources :lessons
      resources :results

      root to: "habits#index"
    end
  resources :days
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :decks do
    resources :cards
  end

	root 'decks#index'
  put ':deck_id/lessons/next_question', to: 'lessons#next_question', as: 'next_question'
  get ':deck_id/lessons/learn', to: 'lessons#learn', as: 'learn'
end
