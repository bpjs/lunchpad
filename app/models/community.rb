class Community < ActiveRecord::Base
  has_many :restaurants
  has_many :members
  has_many :groups

  def existing_restaurant(yelp_url)
    restaurants.where(yelp_url: yelp_url).first
  end
end
