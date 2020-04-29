class Customer < ApplicationRecord
  GENDERS = %w[Masculino Feminino].freeze

  has_one :address, dependent: :destroy
  has_many :devices, dependent: :destroy
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :devices, allow_destroy: true

  validates_presence_of :name
  validates_uniqueness_of :name, on: :create
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
