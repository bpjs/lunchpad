class Group < ActiveRecord::Base
  belongs_to :community
  belongs_to :restaurant
  has_many :members
end
