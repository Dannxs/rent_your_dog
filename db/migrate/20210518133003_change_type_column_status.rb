class ChangeTypeColumnStatus < ActiveRecord::Migration[6.0]
  def up
    remove_column :bookings, :status
    add_column :bookings, :status, :integer
  end

  def down
    remove_column :bookings, :status
    add_column :bookings, :status, :boolean
  end
end
