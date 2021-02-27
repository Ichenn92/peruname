class RenameAvailabilityInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :availibility_start_time, :availability_start_time
    rename_column :users, :availibility_end_time, :availability_end_time
  end
end
