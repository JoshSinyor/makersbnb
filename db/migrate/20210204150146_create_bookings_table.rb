class CreateBookingsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :start_date
      t.bigint :space_id
      t.bigint :user_id
      t.boolean :accepted
    end

  add_foreign_key :bookings, :users
  add_foreign_key :bookings, :spaces
  end
end
