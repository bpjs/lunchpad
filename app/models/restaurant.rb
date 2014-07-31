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

end