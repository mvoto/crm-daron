class AddAddressToCustomers < ActiveRecord::Migration
  def change
    add_reference :customers, :address, index: true
  end
end
