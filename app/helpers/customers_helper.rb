module CustomersHelper
  def setup_customer(customer)
    customer.address ||= Address.new
    customer
  end

  %i[phone cellphone].each do |method_name|
    define_method "complete_#{method_name}" do |customer|
      ddd = "#{method_name}_ddd"
      "#{customer.send(ddd)} #{customer.send(method_name)}"
    end
  end

  def link_to_thumb_or_path(audiometry, audiometry_url)
    if audiometry.thumb.file.nil?
      link_to(audiometry.file.filename, audiometry_url)
    else
      link_to(image_tag(audiometry.thumb), audiometry_url)
    end
  end
end
