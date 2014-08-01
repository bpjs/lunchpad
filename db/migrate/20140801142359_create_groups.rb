class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :community, index: true
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
