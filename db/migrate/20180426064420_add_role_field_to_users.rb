class AddRoleFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, default: 'super'
  end
end
