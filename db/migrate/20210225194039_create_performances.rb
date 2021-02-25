class CreatePerformances < ActiveRecord::Migration[6.1]
  def change
    create_table :performances do |t|
      t.integer :price_per_hour
      t.references :user, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
