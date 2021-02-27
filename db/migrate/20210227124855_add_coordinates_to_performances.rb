class AddCoordinatesToPerformances < ActiveRecord::Migration[6.1]
  def change
    add_column :performances, :latitude, :float
    add_column :performances, :longitude, :float
  end
end
