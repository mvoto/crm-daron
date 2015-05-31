class Device < ActiveRecord::Base

  TYPES 		= [ 'CIC', 'ITC', 'ITE', 'BTE', 'ADP.A', 'REC.C.' ]
  BATTERIES = [ '10', '13', '312', '675' ]
  EAR 			= [ 'Direito', 'Esquerdo' ]
  STORES    = [ 'Unidade I - Santo André', 'Unidade II - Barra Funda',
    'Unidade III - Santos', 'Unidade IV - Praia Grande',
    'Interior de São Paulo']

  belongs_to :customer

  validates_presence_of :brand, :model, :serial_number, :warantee, :_type,
    :ear, :battery
  validates :store, presence: true, if: Proc.new { |a| a.other_store.blank? }
  validates :other_store, presence: true, if: Proc.new { |a| a.store.blank? }
  validates :ear, inclusion: { in: EAR }
  validates :_type, inclusion: { in: TYPES }
  validates :store, inclusion: { in: STORES }, allow_blank: true
  validates :battery, inclusion: { in: BATTERIES }

  def main_store
    other_store.blank? ? store : other_store
  end

end

# == Schema Information
#
# Table name: devices
#
#  id            :integer          not null, primary key
#  purchased_at  :datetime
#  warantee      :integer
#  battery       :string(255)
#  brand         :string(255)
#  model         :string(255)
#  ear           :string(255)
#  _type         :string(255)
#  customer_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#  store         :string(255)
#  other_store   :string(255)
#  serial_number :string(255)
#
