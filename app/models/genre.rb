class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    if self.name.include?(" ")
      self.name.split(" ").join("-").downcase
    else
      self.name.downcase
    end
  end

  def self.find_by_slug(slug)
    self.all.find { |genre| genre.slug == slug }
    #   name = slug.split("-").map {|ele| ele[0].upcase + ele[1..-1] }.join(" ")
    # self.all.find_by(name: name)
  end
end
