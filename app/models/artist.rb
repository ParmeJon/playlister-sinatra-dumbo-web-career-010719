class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(slug)
    name = slug.split("-").map {|ele| ele[0].upcase + ele[1..-1] }.join(" ")
    self.all.find_by(name: name)
  end
end
