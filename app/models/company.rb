class Company < Customer
  validates :cnpj, presence: true

  def self.model_name
    Customer.model_name
  end
end
