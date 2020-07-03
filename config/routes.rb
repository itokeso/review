Rails.application.routes.draw do
  devise_for :users

  root "posts#index"
  get "categories/:id/show" => "categories#show", as: :categories_show
  get "posts/new" => "posts#new"
  post "posts/:post_id/favorites/" => "favorites#create", as: :post_favorites
  delete "posts/:post_id/favorites" => "favorites#destroy"
  get "users/:user_id/reference" => "users#reference", as: :user_reference
  get "animes/search" => "animes#search", as: :anime_search
  
    resources :users, only:  [:show]
    resources :animes, only: [ :index, :new, :create, :show ] do 
      resources :posts, only: [:create, :index, :show, :edit, :update, :destroy] do
      resources :posts, only: [:search] 
        collection do
        get 'search'
      end
    end
  end
end
