class AddOtherStoreToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :other_store, :string
  end
end
