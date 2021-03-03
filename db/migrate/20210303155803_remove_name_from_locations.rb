class RemoveNameFromLocations < ActiveRecord::Migration[6.1]
  def change
    remove_column :locations, :name, :string
  end
end
