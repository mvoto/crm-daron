class AddPhoneDddFieldsToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :phone_ddd, :string
  	add_column :customers, :cellphone_ddd, :string
  end
end
