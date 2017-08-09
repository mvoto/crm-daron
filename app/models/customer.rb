class Customer < ActiveRecord::Base
  GENDERS = %w[Masculino Feminino].freeze

  has_one :address, dependent: :destroy
  has_many :devices, dependent: :destroy
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :devices, allow_destroy: true

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :phone, with: /[0-9]{3,4}[0-9]{4}/
  validates :phone, length: { maximum: 10 }
  validates_presence_of :phone_ddd, unless: :phone_blank?

  mount_uploader :audiometry, AudiometryUploader

  def person?
    type.present? && type == 'Person'
  end

  def company?
    type.present? && type == 'Company'
  end

  # Defines dynamic _blank? methods for attributes listed in the array
  %i[phone cellphone].each do |method_name|
    define_method "#{method_name}_blank?" do
      send(method_name).send(:blank?)
    end
  end

  def complete_phone
    ddd = "(#{phone_ddd})" unless phone_ddd.nil?
    "#{ddd} #{phone}"
  end

  def complete_cellphone
    ddd = "(#{cellphone_ddd})" unless cellphone_ddd.nil?
    "#{ddd} #{cellphone}"
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
