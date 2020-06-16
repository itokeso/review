Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }

  devise_scope :user do
    post 'users/sign_up/complete' => 'users/registrations#complete'
  end

  root "posts#index"
  resources :animes, only: [:new, :create] 
    resources :posts, only: [:new, :create, :index] do
    resources :posts, only: [:search] 
      collection do
      get 'search'
    end
  end
end
