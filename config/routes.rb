Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: {sessions: 'sessions' }

  get 'sessions/new'
  get 'users/new'

  resources :gists

  resources :badges, only: :index
  resources :user_badges, only: :index

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  resources :gists, only: %i[new create]
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index do
      member do
        delete :destroy
      end
    end

    resources :badges
  end

  resources :feedbacks, only: %i[new create]

end
