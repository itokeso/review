class AnimesController < ApplicationController
  before_action :authenticate_user!,　only:[:new, :create]
  def new
    @anime = Anime.new
  end

  def create
    @anime = Anime.new(anime_params)
    if @anime.save
      redirect_to root_path
    else
      render:new
    end
  end

  private
  def anime_params
    params.require(:anime).permit(:title, :image, :genre)
  end
end
