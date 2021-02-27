class RemoveCityFromLocations < ActiveRecord::Migration[6.1]
  def change
    remove_column :locations, :city, :string
  end
end
