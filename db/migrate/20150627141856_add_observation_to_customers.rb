class AddObservationToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :observation, :text
  end
end
