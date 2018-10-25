class Api::SongsController < ApplicationController
  def index
    render json: songs.all
  end

  def create
    songs = songs.new(songs_params)
    if songs.save
      render json: songs
    else
      render json: { errors: songs.errors }, status: :unprocessable_entity 
    end
  end

  def update
    songs = songs.find(params[:id])
    songs.update(complete: !songs.complete)
    render json: songs
  end

  def destroy
    songs.find(params[:id]).destroy
    render json: { message: 'songs deleted' }
  end

  private

  def songs_params
    params.require(:songs).permit(:name, :complete)
  end
end
