class BandGenre < ActiveRecord::Base
  # only need relationships right now
  belongs_to :band
  belongs_to :genre
  
  validates_numericality_of :genre_id, :only_integer => true, :greater_than => 0
  
end
