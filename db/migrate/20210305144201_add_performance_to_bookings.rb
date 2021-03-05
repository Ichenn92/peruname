class AddPerformanceToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :performance, null: false, foreign_key: true
  end
end
