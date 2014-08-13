class CreateMemberCommunities < ActiveRecord::Migration
  def change
    create_table :member_communities do |t|
      t.references :member, index: true
      t.references :community, index: true

      t.timestamps
    end
  end
end
