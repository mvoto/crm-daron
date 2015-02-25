class Customer < ActiveRecord::Base

  attr_accessor :phone_ddd, :cellphone_ddd

  LOST_TYPES   = [ 'Moderada', 'Moderada a Severa', 'Profunda' ]
  DEVICE_TYPES = [ 'CIC', 'ITC', 'ITE' ]
  STORES       = [ 'Unidade I', 'Unidade II' ]
  GENDERS      = [ 'Masculino', 'Feminino' ]

  before_save :build_phones

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  validates_presence_of :name, :store
  validates_format_of :phone, with: /[0-9]{3,4}[0-9]{4}/
  validates :phone, length: { maximum: 11 }
  validates_presence_of :phone_ddd, unless: :phone_blank?
  validates_presence_of :cellphone_ddd, unless: :cellphone_blank?
  validates :re_device_type, :le_device_type, inclusion: { in: DEVICE_TYPES },
    allow_blank: true
  validates :re_lost_type, :le_lost_type,   inclusion: { in: LOST_TYPES },
    allow_blank: true
  validates :store, inclusion: { in: STORES }, allow_blank: true

  def person?
    type.present? && type == 'Person'
  end

  def company?
    type.present? && type == 'Company'
  end

  private
  def build_phones
    self.phone = "#{self.phone_ddd} #{self.phone}"
    self.cellphone = "#{self.cellphone_ddd} #{self.cellphone}"
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
#  gender             :string(255)
#  career             :string(255)
#
