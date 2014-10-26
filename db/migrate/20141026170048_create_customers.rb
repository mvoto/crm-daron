class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :le_lost_type
      t.string :re_lost_type
      t.string :le_device_type
      t.stringstore :re_device_type

      t.timestamps
    end
  end
end
