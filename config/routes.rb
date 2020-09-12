Rails.application.routes.draw do
  devise_for :users
  resources :decks do
    resources :cards, except: :show
  end

  root 'decks#index'
  put ':deck_id/lessons/next_question', to: 'lessons#next_question', as: 'next_question'
  get ':deck_id/lessons/learn', to: 'lessons#learn', as: 'learn'
end
