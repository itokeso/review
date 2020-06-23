Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }

  devise_scope :user do
    post 'users/sign_up/complete' => 'users/registrations#complete'
  end

  root "posts#index"
  
  resources :animes, only: [:new, :create] do 
    resources :posts, only: [:new, :create, :index, :show] 
    resources :posts, only: [:search] 
      collection do
      get 'search'
    end
  end
  resources :posts, only: [:new, :create, :index, :show] do
    resource :favorites, only: [:create, :destroy]
  end
end
