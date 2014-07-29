class Community < ActiveRecord::Base
  has_many :restaurants
  has_many :members
end
