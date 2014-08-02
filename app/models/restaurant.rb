class Restaurant < ActiveRecord::Base
  belongs_to :community
  has_many :reviews

  def review_average
    if reviews.length != 0
      ((reviews.average("rating") * 2).floor / 2.0).to_f
    else
      "No reviews yet"
    end
  end

  def self.existing_restaurant(yelp_url)
    find_by(yelp_url: yelp_url)
  end

  def self.by_average_rating_for_community(community_id)
    where(community_id: community_id).joins("left outer join reviews on restaurants.id = reviews.restaurant_id").group("restaurants.id").order("AVG(reviews.rating) DESC NULLS LAST")
  end

end

    where(community_id: community_id)
    .joins("left outer join reviews on restaurants.id = reviews.restaurant_id")
    .group("restaurants.id").order("AVG(reviews.rating) DESC")