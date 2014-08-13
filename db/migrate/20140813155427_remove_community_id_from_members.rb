class RemoveCommunityIdFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :community_id
  end
end
