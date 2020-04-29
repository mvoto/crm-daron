class Person < Customer
  validates_format_of :cellphone, with: /[9]?[2-9][0-9]{3}[0-9]{4}/,
    if: lambda{ |obj| obj.cellphone.present? }
  validates :cellphone, length: { maximum: 10 }
  validates_presence_of :cellphone_ddd, unless: :cellphone_blank?

  def self.model_name
    Customer.model_name
  end
end
