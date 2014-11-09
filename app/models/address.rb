class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :customer
  # validates_presence_of :street, :city, :number

  def state
    city.nil? ? '-' : city.state
  end
end

# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  street       :string(255)
#  number       :integer
#  neighborhood :string(255)
#  zipcode      :string(255)
#  city_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  customer_id  :integer
#  state_id     :integer
#
