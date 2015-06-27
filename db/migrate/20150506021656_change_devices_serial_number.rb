class ChangeDevicesSerialNumber < ActiveRecord::Migration
  def change
  	remove_column :devices, :serial_number
  	add_column :devices, :serial_number, :string
  end
end
