class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    album = Album.new
    album.update(album_params)
    if album.save
      redirect_to album
    else
      # binding.pry
      @error = album.errors.messages[:title].first
      @album = Song.new
      render :new
    end
  end

  def album_params
      params.require(:album).permit(:name, :year, :image)
  end

end