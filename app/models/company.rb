class Company < Customer
  validates_presence_of :cnpj

  def self.model_name
    Customer.model_name
  end
end

# == Schema Information
#
# Table name: customers
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  email              :string(255)
#  phone              :string(255)
#  cellphone          :string(255)
#  le_lost_type       :string(255)
#  re_lost_type       :string(255)
#  le_device_type     :string(255)
#  re_device_type     :string(255)
#  store              :string(255)
#  dob                :datetime
#  rg                 :string(255)
#  cpf                :string(255)
#  cnpj               :string(255)
#  state_registration :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  purchased_at       :datetime
#  type               :string(255)
#  career             :string(255)
#  gender             :boolean          default(TRUE)
#  phone_ddd          :string(255)
#  cellphone_ddd      :string(255)
#  re                 :integer
#  model              :string(255)
#  brand              :string(255)
#  battery            :string(255)
#  serial_number      :integer
#  value              :decimal(5, 2)
#  warantee           :integer
#
