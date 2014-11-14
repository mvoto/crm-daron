require 'rails_helper'

RSpec.describe Customer, type: :model do

  describe 'Validations:' do

    let(:customer) { build(:customer) }

    [:name, :store].each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    context 'inclusions' do
      let(:lost_types) { [ 'Moderada', 'Moderada a Severa', 'Profunda' ] }
      let(:device_types) { [ 'CIC', 'ITC', 'ITE' ] }
      let(:stores) { [ 'Unidade I', 'Unidade II' ] }

      it 'validates inclusion of' do
        expect(customer).to validate_inclusion_of(:re_lost_type)
          .in_array(lost_types)
        expect(customer).to validate_inclusion_of(:le_lost_type)
          .in_array(lost_types)
        expect(customer).to validate_inclusion_of(:re_device_type)
          .in_array(device_types)
        expect(customer).to validate_inclusion_of(:le_device_type)
          .in_array(device_types)
        expect(customer).to validate_inclusion_of(:store).in_array(stores)
      end
    end

    context 'given the phone' do

      it 'validates format and length' do
        expect(customer).to_not allow_value('(11)4433-1122').for(:phone)
        expect(customer).to_not allow_value('(011)4433-1122').for(:phone)
        expect(customer).to allow_value('1144331122').for(:phone)
        expect(customer).to_not allow_value('118').for(:phone)
        expect(customer).to ensure_length_of(:phone).is_at_most(13)
      end
    end
  end
end
