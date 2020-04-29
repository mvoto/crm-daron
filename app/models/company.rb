class Company < Customer
  validates :cnpj, presence: true

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
#  dob                :datetime
#  rg                 :string(255)
#  cpf                :string(255)
#  cnpj               :string(255)
#  state_registration :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  type               :string(255)
#  career             :string(255)
#  gender             :boolean          default(TRUE)
#  phone_ddd          :string(255)
#  cellphone_ddd      :string(255)
#  re                 :string(255)
#  observation        :text
#
