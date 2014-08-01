class AddGroupRefToMembers < ActiveRecord::Migration
  def change
    add_reference :members, :group, index: true
  end
end
