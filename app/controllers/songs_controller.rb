class SongsController < ApplicationController
    set :views, "app/views/songs"

    get '/songs' do
        @songs = Song.all 
        erb :index
    end
    
end
