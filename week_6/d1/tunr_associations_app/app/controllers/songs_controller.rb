class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    # binding.pry
    @song = Song.find(params[:id])
    @albums = Song.find(params[:id]).albums.all
  end

  def new
    @song = Song.new
    @artists = Artist.all
  end

  def create
    song = Song.new
    song.update(song_params)
    if song.save
      redirect_to song
    else
      # binding.pry
      @error = song.errors.messages[:title].first
      @song = Song.new
      @artists = Artist.all
      render :new
    end
  end

private

  def song_params
      params.require(:song).permit(:title, :artist_id)
  end


end
