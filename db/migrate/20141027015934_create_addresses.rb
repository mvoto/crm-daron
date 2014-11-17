class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :number
      t.string :neighborhood
      t.string :zipcode
      t.references :city, index: true

      t.timestamps
    end
  end
end
