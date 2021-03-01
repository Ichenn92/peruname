class RemoveCoordinatesFromPerformances < ActiveRecord::Migration[6.1]
  def change
    remove_column :performances, :latitude, :float
    remove_column :performances, :longitude, :float
  end
end
