module CustomersHelper
  def setup_customer(customer)
    customer.address ||= Address.new
    customer
  end

  [:phone, :cellphone].each do |method_name|
    define_method "complete_#{method_name}" do |customer|
      ddd = "#{method_name}_ddd"
      "#{customer.send(ddd)} #{customer.send(method_name)}"
    end
  end
end
