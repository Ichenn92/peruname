class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.time :start_time
      t.time :end_time
      t.decimal :total_cost, default: 0.0

      t.timestamps
    end
  end
end
