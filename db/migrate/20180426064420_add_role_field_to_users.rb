class AddRoleFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, default: 'Básico'
  end
end
