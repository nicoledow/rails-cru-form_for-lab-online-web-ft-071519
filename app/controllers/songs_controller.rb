class SongsController < ApplicationController

    def show
        @song = Song.find_by_id(params["id"])
        @genre = Genre.find_by_id(@song.genre_id)
        @artist = Artist.find_by_id(@song.artist_id)
    end

    def index
        @songs = Song.all
    end

    def new
    end

    def create
        @song = Song.create(song_params)
        redirect_to song_path(@song)
    end

    def edit
        @song = Song.find_by_id(params["id"])
    end

    def update
        @song = Song.find_by_id(params["id"])
        @song.update(song_params)
        redirect_to song_path(@song)
    end

    

    
    private
    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end
