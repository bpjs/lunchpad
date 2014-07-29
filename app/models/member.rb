class Member < ActiveRecord::Base
  belongs_to :community
  has_many :reviews
end
