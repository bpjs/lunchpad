class Restaurant < ActiveRecord::Base
  belongs_to :community
  has_many :reviews

  def review_average
    ((reviews.average("rating") * 2).floor / 2.0).to_f
  end

end