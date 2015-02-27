class AddModelBrandBatteryAndSerialNumberToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :model, :string
    add_column :customers, :brand, :string
    add_column :customers, :battery, :string
    add_column :customers, :serial_number, :integer
  end
end
