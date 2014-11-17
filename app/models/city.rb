class City < ActiveRecord::Base
  belongs_to :state

  default_scope { order(:name) }

  def to_s
    name
  end
end

# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  state_id   :integer
#  created_at :datetime
#  updated_at :datetime
#
