class AddStateToAddresses < ActiveRecord::Migration
  def change
    add_reference :addresses, :state, index: true
  end
end
