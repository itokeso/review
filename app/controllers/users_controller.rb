class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @all_posts = @user.posts
    @posts = @user.posts.page(params[:page]).order(id: 'desc').per(5)
    @all_ranks = Anime.find(Post.group(:anime_id).order('count(anime_id) desc').limit(5).pluck(:anime_id))
  end
  
  def like
    @user = User.find(params[:id])
    @like = @user.favorites.id
  end
end
