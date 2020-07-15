class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @all_ranks = Anime.find(Post.group(:anime_id).order('count(anime_id) desc').limit(5).pluck(:anime_id))
  end
end
