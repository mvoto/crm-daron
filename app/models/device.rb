class Device < ApplicationRecord

  TYPES     = [ 'CIC', 'ITC', 'ITE', 'BTE', 'ADP.A', 'REC.C.' ]
  BATTERIES = [ '10', '13', '312', '675', 'Recarregável' ]
  EAR       = [ 'Direito', 'Esquerdo' ]
  STORES    = [ 'Unidade I - Santo André', 'Unidade II - Barra Funda',
    'Unidade III - Santos', 'Unidade IV - Praia Grande', 'Unidade V - Lapa',
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
