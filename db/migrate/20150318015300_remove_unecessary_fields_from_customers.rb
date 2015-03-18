class RemoveUnecessaryFieldsFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :purchased_at, :datetime
    remove_column :customers, :re_device_type, :string
    remove_column :customers, :le_device_type, :string
    remove_column :customers, :store, :string
    remove_column :customers, :other_store, :string
    remove_column :customers, :serial_number, :string
    remove_column :customers, :warantee, :integer
    remove_column :customers, :model, :string
    remove_column :customers, :brand, :string
    remove_column :customers, :battery, :string
  end
end
