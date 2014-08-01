class Community < ActiveRecord::Base
  has_many :restaurants
  has_many :members
  has_many :groups
end
