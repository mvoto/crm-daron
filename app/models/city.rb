class City < ApplicationRecord
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
