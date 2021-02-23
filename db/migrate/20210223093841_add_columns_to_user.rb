class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :actor, :boolean, default: false, null: false
    add_column :users, :nickname, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :availibility_start_time, :time
    add_column :users, :availibility_end_time, :time
  end
end
