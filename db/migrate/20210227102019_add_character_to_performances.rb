class AddCharacterToPerformances < ActiveRecord::Migration[6.1]
  def change
    add_reference :performances, :character, null: false, foreign_key: true
  end
end
