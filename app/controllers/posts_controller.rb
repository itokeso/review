class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @posts = Post.all.page(params[:page]).order(id: 'desc').per(5)
    @anime =  Anime.find(Post.group(:anime_id).order('count(anime_id) desc').limit(12).pluck(:anime_id))
    @all_ranks = Anime.find(Post.group(:anime_id).order('count(anime_id) desc').limit(5).pluck(:anime_id))
    @categories = Category.all
  end

  def new
    @post = Post.new
    @anime = Anime.all
  end

  def create
    @amime = Anime.find_by(id: params[:anime_id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @all_ranks = Anime.find(Post.group(:anime_id).order('count(anime_id) desc').limit(5).pluck(:anime_id))
    @anime = Anime.find(params[:anime_id]) 
    @categories = Category.all
    # @anime_other = @anime.posts.where.not(user_id: current_user.id)
  end
  
  def edit
    @post = Post.find(params[:id])
    @anime = @post.anime.id
  end

  def update

    @post = Post.find(params[:id])
    @anime = @post.anime.id
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.delete
      redirect_to root_path
    else
      render :show
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
