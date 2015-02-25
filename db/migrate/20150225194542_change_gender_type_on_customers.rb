class ChangeGenderTypeOnCustomers < ActiveRecord::Migration
  def change
  	remove_column :customers, :gender
  	add_column :customers, :gender, :boolean, default: true
  end
end
