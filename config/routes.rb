Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books do
    resources :comments, only: %i[create edit update destroy], module: 'books'
  end
  resources :reports do
    resources :comments, only: %i[create edit update destroy], module: 'reports'
  end
  resources :users, only: %i[index show] do
    resource :relationships, only: %i[create destroy]
    scope module: :users do
      resources :followings, only: [:index]
      resources :followers, only: [:index]
    end
    resources :reports, only: [:index], controller: 'users/reports'
  end
end
