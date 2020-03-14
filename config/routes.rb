Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :decks do
    resources :cards
  end

  root 'decks#index'
  put ':deck_id/lessons/next_question', to: 'lessons#next_question', as: 'next_question'
  get ':deck_id/lessons/learn', to: 'lessons#learn', as: 'learn'
end
