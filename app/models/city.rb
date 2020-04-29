class City < ApplicationRecord
  belongs_to :state
  has_many :addresses

  default_scope { order(:name) }

  def to_s
    name
  end

  def full_name
    "#{name} - #{state.acronym}"
  end
end
