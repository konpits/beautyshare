class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :consultant
      t.references :consumer
      t.datetime :check_in
      t.datetime :checkout
      t.string :status
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
