class City < ActiveRecord::Base
  belongs_to :state
  has_many :addresses

  default_scope { order(:name) }
  scope :on_address, -> { includes(:state).joins(:addresses).distinct }

  def to_s
    name
  end

  def full_name
    "#{name} - #{state.acronym}"
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
