class Community < ActiveRecord::Base
  has_many :restaurants
  has_many :members

  def restaurants_by_average_rating
    
  end

end
