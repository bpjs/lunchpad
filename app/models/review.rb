class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :member

  validates_presence_of :restaurant_id, :member_id
  validates :rating, presence: true, inclusion: {in: 0..5,
                                                 message: "must be between 0 and 5"
                                                }
  validates :text, presence: true, length: {minimum: 10}

end
