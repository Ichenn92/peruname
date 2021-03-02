class AddIndexToLocationsAddressLatitudeLongitude < ActiveRecord::Migration[6.1]
  def change
    add_index :locations, :address
    add_index :locations, :latitude
    add_index :locations, :longitude
  end
end
