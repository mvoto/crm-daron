class Customer < ActiveRecord::Base

  LOST_TYPES   = [ 'Moderada', 'Severa', 'Profunda' ]
  DEVICE_TYPES = [ 'CIC', 'ITC', 'ITE', 'BTE', 'ADP.A', 'REC.C.' ]
  GENDERS      = [ 'Masculino', 'Feminino' ]
  BATTERIES    = [ '10', '13', '312', '675' ]
  STORES       = [ 'Unidade I - Santo André', 'Unidade II - Barra Funda',
    'Unidade III - Santos', 'Unidade IV - Praia Grande',
    'Interior de São Paulo']


  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  validates_presence_of :name, :store
  validates_format_of :phone, with: /[0-9]{3,4}[0-9]{4}/
  validates :phone, length: { maximum: 10 }
  validates_presence_of :phone_ddd, unless: :phone_blank?
  validates :battery, inclusion: { in: BATTERIES }, allow_blank: true
  validates :store, inclusion: { in: STORES }, allow_blank: true
  validates :re_device_type, :le_device_type, inclusion: { in: DEVICE_TYPES },
    allow_blank: true

  def person?
    type.present? && type == 'Person'
  end

  def company?
    type.present? && type == 'Company'
  end

  def main_store
    other_store.blank? ? store : other_store
  end

  # Defines dynamic _blank? methods for attributes listed in the array
  [:phone, :cellphone].each do |method_name|
    define_method "#{method_name}_blank?" do
      send(method_name).send(:blank?)
    end
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
