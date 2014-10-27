module CustomersHelper
  def setup_customer(customer)
    customer.address ||= Address.new
    customer
  end
end
