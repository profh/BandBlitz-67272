class Band < ActiveRecord::Base
  attr_accessor :genre_check
  
  # relationships
  has_many :band_genres
  has_many :genres, :through => :band_genres
  has_many :comments, :dependent => :destroy

  # scopes
  scope :alphabetical, -> { order('name') }
  
  # basic validation
  validates_presence_of :name, :description
  validate :at_least_one_genre_chosen
  
  def self.check_genres(genres)
    if genres.nil? || genres.empty?
      @genre_check = false
    elsif
      ids = Genre.all.map{|g| g.id}
      genres.each{ |g| @genre_check == false unless ids.include? g }
    else
      @genre_check = true
    end
  end
  
  def at_least_one_genre_chosen
    self.errors.add_to_base "Choose as least one valid genre" if @genre_check == false
  end
  
  # uploaders
  mount_uploader :photo, PhotoUploader
  mount_uploader :song, SongUploader
end
