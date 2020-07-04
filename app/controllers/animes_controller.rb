class AnimesController < ApplicationController
  before_action :authenticate_user!,  only:[:new, :create]
  
  def index
    @anime = Anime.find(params[:id])
    @genre = @anime.genre
  end

  def new
    @anime = Anime.new
    @categories = Category.all
  end

  def create
    @anime = Anime.new(anime_params)
    if @anime.save
      redirect_to root_path
    else
      render:new
    end
  end

  def show
    @anime = Anime.find(params[:id])
    @post = @anime.posts.order(id: "desc").limit(3)
    @all_ranks = Anime.find(Post.group(:anime_id).order('count(anime_id) desc').limit(5).pluck(:anime_id))
    @categories = Category.all
  end

  def search
    @anime = Anime.search(params[:search])
  end

  private
  def anime_params
    params.require(:anime).permit(:title, :image, :genre, :detail,:category_id)
  end
end

