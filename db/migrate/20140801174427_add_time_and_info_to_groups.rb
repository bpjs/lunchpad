class AddTimeAndInfoToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :time, :time
    add_column :groups, :info, :string
  end
end
