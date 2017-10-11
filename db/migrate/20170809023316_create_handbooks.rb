class CreateHandbooks < ActiveRecord::Migration
  def change
    create_table :handbooks do |t|
      t.string :information
      t.references :customer, index: true

      t.timestamps
    end
  end
end
