class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :text
      t.float :rating
      t.references :restaurant, index: true
      t.references :member, index: true

      t.timestamps
    end
  end
end
