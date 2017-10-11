class Handbook < ActiveRecord::Base
  belongs_to :customer
  validates_presence_of :information, :customer_id
end
