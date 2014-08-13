class Community < ActiveRecord::Base
  has_many :restaurants
  has_many :members
  has_many :groups

  validates_presence_of :name
  validate :validate_latitude_and_longitude

  def existing_restaurant(yelp_url)
    restaurants.where(yelp_url: yelp_url).first
  end

  def address=(address)
    self.latitude, self.longitude = Geocoder.coordinates(address)

  end

  private

  def validate_latitude_and_longitude
    if self.latitude == nil || self.longitude == nil
      self.errors.add(:base, "Not a valid address")
    end
  end
end
