require 'rails_helper'

RSpec.describe Device, type: :model do

  describe 'Validations' do

    let(:device) { build(:device) }

    context 'inclusions' do
      let(:types) 		{ Device::TYPES }
      let(:batteries) { Device::BATTERIES }
      let(:ears) { Device::EAR }
      let(:stores) { [ 'Unidade I - Santo André', 'Unidade II - Barra Funda',
        'Unidade III - Santos', 'Unidade IV - Praia Grande', 'Unidade V - Lapa',
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

    context 'presence' do
      [:brand, :model, :serial_number, :warantee, :_type, :ear,
        :battery].each do |attr|
        it { should validate_presence_of(attr) }
      end

      context 'when other store is not blank' do
        subject { build(:device, other_store: '123', store: nil) }

        it { should_not validate_presence_of(:store) }
        it { should validate_presence_of(:other_store) }
      end

      context 'when store is not blank' do
        subject { build(:device, store: '123', other_store: nil) }

        it { should_not validate_presence_of(:other_store) }
        it { should validate_presence_of(:store) }
      end

      context 'when store and other store are blank' do
        subject { build(:device, store: nil, other_store: nil) }

        it { should validate_presence_of(:store) }
        it { should validate_presence_of(:other_store) }
      end
    end

  end
end
