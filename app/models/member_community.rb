class MemberCommunity < ActiveRecord::Base
  belongs_to :member
  belongs_to :community
end
