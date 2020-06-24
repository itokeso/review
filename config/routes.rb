Rails.application.routes.draw do
  devise_for :users
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
