class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.time :start_time
      t.time :end_time
      t.integer :price
      t.integer :status, default: 0
      t.integer :client_id, null: false, index: true
      t.integer :actor_id, null: false, index: true
      t.references :performance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
