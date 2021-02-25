class AddDescriptionToPerformances < ActiveRecord::Migration[6.1]
  def change
    add_column :performances, :description, :text
  end
end
