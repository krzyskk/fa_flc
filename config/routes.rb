Rails.application.routes.draw do
  resources :chores, only: [:index, :destroy]
  resources :tasks
  resources :results, only: [] do
    member do 
      post 'toggle'
    end
  end

  resources :days do 
    # member do 
    resources :chores, only: [:create]
    # end 
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :decks do
    resources :cards
  end

  root 'decks#index'
  put ':deck_id/lessons/next_question', to: 'lessons#next_question', as: 'next_question'
  get ':deck_id/lessons/learn', to: 'lessons#learn', as: 'learn'
end
