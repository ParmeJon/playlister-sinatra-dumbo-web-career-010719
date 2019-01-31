class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    if !params[:artist][:name].empty?
      artist = Artist.create(params[:artist])
    end
    new = Song.create(name: params[:song][:name], artist_id: artist.id)
    redirect to ("/songs/#{new.slug}")
  end

end
