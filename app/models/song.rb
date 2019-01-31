class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :songs_genres
  has_many :genres, through: :songs_genres
  
  def find_by_slug
  end
end
