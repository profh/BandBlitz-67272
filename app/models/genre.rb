class Genre < ActiveRecord::Base
  # relationships
  has_many :band_genres
  has_many :bands, :through => :band_genres
  
  # basic validation
  validates_presence_of :name
  
  # scopes
  scope :alphabetical, -> { order('name') }
end
