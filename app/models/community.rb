class Community < ActiveRecord::Base
  has_many :restaurants
  has_many :members
  has_many :groups

  validates_presence_of :name
  validates :latitude, presence: true, numericality: {greater_than_or_equal_to: -180, less_than_or_equal_to: 180}
  validates :longitude, presence: true, numericality: {greater_than_or_equal_to: -180, less_than_or_equal_to: 180}

  def existing_restaurant(yelp_url)
    restaurants.where(yelp_url: yelp_url).first
  end

  def address=(address)
    self.latitude, self.longitude = Geocoder.coordinates(address)
  end

end
