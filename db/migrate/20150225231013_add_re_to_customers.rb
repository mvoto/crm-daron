class AddReToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :re, :integer
  end
end
