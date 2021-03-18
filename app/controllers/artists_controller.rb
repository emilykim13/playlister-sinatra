require 'rack-flash'

class ArtistsController < ApplicationController
    set :views, "app/views/artists"

    get '/artists' do
        @artists = Artist.all 
        erb :index
    end
    
end
