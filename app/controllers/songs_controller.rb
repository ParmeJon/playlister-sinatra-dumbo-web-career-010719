require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    if !params[:song][:artist_id].empty?
      new = Song.create(params[:song])
    elsif !params[:artist][:name].empty?
      artist = Artist.create(params[:artist])
      new = Song.create(name: params[:song][:name], artist_id: artist.id)
    end
    redirect to ("/songs/#{new.slug}")
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

end
