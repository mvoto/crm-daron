require 'rails_helper'

RSpec.describe Device, type: :model do

  describe 'Validations:' do

    let(:device) { build(:device) }

    [:brand, :model, :ear].each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    context 'inclusions' do
      let(:types) 		{ Device::TYPES }
      let(:batteries) { Device::BATTERIES }
      let(:ears) { Device::EAR }

      it 'validates inclusion of' do
        expect(device).to validate_inclusion_of(:_type)
          .in_array(types)
        expect(device).to validate_inclusion_of(:battery)
          .in_array(batteries)
        expect(device).to validate_inclusion_of(:ear)
          .in_array(ears)
      end
    end

  end
end
