require 'rails_helper'

RSpec.describe Device, type: :model do

  describe 'Validations:' do

    let(:device) { build(:device) }

    context 'inclusions' do
      let(:types) 		{ Device::TYPES }
      let(:batteries) { Device::BATTERIES }
      let(:ears) { Device::EAR }
      let(:stores) { [ 'Unidade I - Santo André', 'Unidade II - Barra Funda',
        'Unidade III - Santos', 'Unidade IV - Praia Grande',
        'Interior de São Paulo' ] }


      it 'validates inclusion of' do
        expect(device).to validate_inclusion_of(:_type)
          .in_array(types)
        expect(device).to validate_inclusion_of(:battery)
          .in_array(batteries)
        expect(device).to validate_inclusion_of(:ear)
          .in_array(ears)
        expect(device).to validate_inclusion_of(:store).in_array(stores)
      end
    end

  end
end
