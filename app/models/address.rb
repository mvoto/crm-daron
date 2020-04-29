class Address < ApplicationRecord
  belongs_to :city
  belongs_to :customer

  def state
    city.nil? ? state_by_id : city.state
  end

  protected

  def state_by_id
    state_id.nil? ? '-' : State.find(state_id)
  end
end
