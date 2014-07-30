class AddLatitudeAndLongitudeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :latitude, :float
    add_column :restaurants, :longitude, :float
    remove_column :restaurants, :address
  end
end
