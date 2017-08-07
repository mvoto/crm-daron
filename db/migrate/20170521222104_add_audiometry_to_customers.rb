class AddAudiometryToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :audiometry, :string
  end
end
