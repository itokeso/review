class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  def index

  end

  def new
    @post = Post.new
    @anime = Anime.all

  end

  def create
    @amime = Anime.find_by(params[:id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def search
    @animes = Anime.where('title LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :review, :rate, :anime_id).merge(user_id: current_user.id)
  end
end
