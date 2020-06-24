class FavoritesController < ApplicationController
  before_action :set_favorites

  def create
    @favorite = current_user.favorites.create(post_id: params[:post_id])
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    @favorite.destroy
  end

  def set_favorites
    @post = Post.find(params[:post_id])
    @id_name = "#favorites_buttons_#{@post.id}"
  end
end
