class Customer < ActiveRecord::Base
  LOST_TYPES   = [ 'Moderada', 'Moderada a Severa', 'Profunda' ]
  DEVICE_TYPES = [ 'CIC', 'ITC', 'ITE' ]
  STORES       = [ 'Unidade I, Unidade II' ]

  validates_presence_of :name, :store
  validates_format_of :phone, with: /[0-9]{2}?[0-9]{3,4}[0-9]{4}/
  validates :re_device_type, :le_device_type, inclusion: { in: DEVICE_TYPES },
    allow_blank: true
  validates :re_lost_type, :le_lost_type,   inclusion: { in: LOST_TYPES },
    allow_blank: true
  validates :store, inclusion: { in: STORES }, allow_blank: true
end
