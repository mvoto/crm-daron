class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :acronym
      t.string :name
      t.integer :capital_id

      t.timestamps
    end

    add_index :states, :capital_id
  end
end
