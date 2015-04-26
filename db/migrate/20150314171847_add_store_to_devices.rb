class AddStoreToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :store, :string
    add_column :devices, :other_store, :string
  end
end
