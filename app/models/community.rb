class Community < ActiveRecord::Base
  has_many :restaurants
  has_many :members
  has_many :groups

  def ungroupedRestaurants
    Restaurant.where(community_id: id).where.not(id: Group.select(:restaurant_id))
  end
end
