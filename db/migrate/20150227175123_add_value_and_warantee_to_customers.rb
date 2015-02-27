class AddValueAndWaranteeToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :value, :string
    add_column :customers, :warantee, :integer
  end
end
