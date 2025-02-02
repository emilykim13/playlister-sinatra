require 'rack-flash'

class ArtistsController < ApplicationController
    set :views, "app/views/artists"

    get '/artists' do
        @artists = Artist.all 
        erb :index
    end

    get "/artists/:slug" do 
        @artist = Artist.find_by_slug(params[:slug])
        erb :show
    end
    
end
