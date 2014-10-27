class State < ActiveRecord::Base
  has_many :cities
  belongs_to :capital, class_name: 'City'
end

# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  acronym    :string(255)
#  name       :string(255)
#  capital_id :integer
#  created_at :datetime
#  updated_at :datetime
#
