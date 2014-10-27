class Address < ActiveRecord::Base
  belongs_to :city
end

# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  street       :string(255)
#  number       :integer
#  neighborhood :string(255)
#  city_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#
