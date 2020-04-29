class State < ApplicationRecord
  has_many :cities
  belongs_to :capital, class_name: 'City'

  def to_s
    acronym
  end
end
