require 'rack-flash'
class SongsController < ApplicationController
    set :views, "app/views/songs"

    get '/songs' do
        @songs = Song.all 
        erb :index
    end

    get '/songs/new' do
        erb :new
    end

    get '/songs/:slug' do
        @songs = Song.find_by_slug(params[:slug])
        erb :show
    end

    post '/songs' do
        @songs = Song.create(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genres_id = params[:genres]
        @song.save
        flash[:message] = "Successfully created song."
        redirect ("/songs/#{@song.slug}")
      end


end
