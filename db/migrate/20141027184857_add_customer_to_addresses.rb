class AddCustomerToAddresses < ActiveRecord::Migration
  def change
    add_reference :addresses, :customer, index: true
  end
end
