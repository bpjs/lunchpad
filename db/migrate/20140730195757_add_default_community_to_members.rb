class AddDefaultCommunityToMembers < ActiveRecord::Migration
  def change
    change_column :members, :community_id, :integer, default: 1
  end
end
