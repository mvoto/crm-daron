class AddReToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :re, :string
  end
end
