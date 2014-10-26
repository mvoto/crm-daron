json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :email, :phone, :le_lost_type, :re_lost_type, :le_device_type, :re_device_type
  json.url customer_url(customer, format: :json)
end
