class RemoveValueLeLostTypeAndReLostTypeFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :value, :string
    remove_column :customers, :le_lost_type, :string
    remove_column :customers, :re_lost_type, :string
  end
end
