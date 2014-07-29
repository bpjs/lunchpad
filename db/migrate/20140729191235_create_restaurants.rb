class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :category
      t.string :yelp_url
      t.string :address
      t.references :community, index: true

      t.timestamps
    end
  end
end
