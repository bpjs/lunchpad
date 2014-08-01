class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :member

  validates_presence_of :restaurant_id, :member_id
  validates :rating, presence: true, inclusion: {in: 1..5,
                                                 message: "must be between 1 and 5 stars"
                                                }
  validates :text, presence: true, length: {minimum: 10}

end
