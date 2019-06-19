class AddStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :booking_completed, :boolean, :null => false, :default => false
  end
end
