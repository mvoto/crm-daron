class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :cellphone
      t.string :le_lost_type
      t.string :re_lost_type
      t.string :le_device_type
      t.string :re_device_type
      t.string :store
      t.datetime :dob
      t.string :rg
      t.string :cpf
      t.string :cnpj
      t.string :state_registration

      t.timestamps
    end
  end
end
