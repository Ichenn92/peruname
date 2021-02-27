class AddPerformanceCategoryToPerformances < ActiveRecord::Migration[6.1]
  def change
    add_reference :performances, :performance_category, null: false, foreign_key: true
  end
end
