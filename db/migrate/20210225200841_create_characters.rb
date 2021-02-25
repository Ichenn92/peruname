class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name, null: false, index: true
      t.references :character_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
