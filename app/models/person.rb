class Person < Customer
  validates_format_of :cellphone, with: /[9]?[2-9][0-9]{3}[0-9]{4}/,
    if: lambda{ |obj| obj.cellphone.present? }
  validates :cellphone, length: { maximum: 10 }
  validates_presence_of :cellphone_ddd, unless: :cellphone_blank?

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
#  re                 :integer
#
