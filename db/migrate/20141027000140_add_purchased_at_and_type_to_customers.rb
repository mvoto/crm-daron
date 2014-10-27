class AddPurchasedAtAndTypeToCustomers < ActiveRecord::Migration
  def up
    add_column :customers, :purchased_at, :datetime
    add_column :customers, :type, :string
  end

  def down
    remove_column :customers, :purchased_at
    remove_column :customers, :type
  end
end
