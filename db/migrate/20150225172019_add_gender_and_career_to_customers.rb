class AddGenderAndCareerToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :gender, :string
  	add_column :customers, :career, :string
  end
end
