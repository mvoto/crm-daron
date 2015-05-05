class ChangeReCustomers < ActiveRecord::Migration
  def change
  	remove_column :customers, :re
  	add_column :customers, :re, :string
  end
end
