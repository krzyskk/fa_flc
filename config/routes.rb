Rails.application.routes.draw do
  devise_for :users
  resources :decks do
    resources :cards, except: :show
    member do
      get 'learn'
      put 'next_question'
    end
  end

  root 'decks#index'
end
