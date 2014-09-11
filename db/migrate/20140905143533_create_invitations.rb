class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :sender_id
      t.integer :group_id
      t.integer :invitee_id

      t.timestamps
    end
  end
end