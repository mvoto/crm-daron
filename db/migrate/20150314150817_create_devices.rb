class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.datetime :purchased_at
      t.integer :warantee
      t.string :battery
      t.integer :serial_number
      t.string :brand
      t.string :model
      t.string :ear
      t.string :_type
      t.references :customer

      t.timestamps
    end
  end
end
