require 'rails_helper'

RSpec.describe Customer, type: :model do

  describe 'Validations:' do

    let(:customer) { build(:customer) }

    [:name, :store].each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    context 'inclusions' do
      let(:stores) { [ 'Unidade I - Santo André', 'Unidade II - Barra Funda',
        'Unidade III - Santos', 'Unidade IV - Praia Grande',
        'Interior de São Paulo' ] }

      it 'validates inclusion of' do
        expect(customer).to validate_inclusion_of(:store).in_array(stores)
      end
    end

    context 'given the phone' do

      it 'validates format and length' do
        expect(customer).to ensure_length_of(:phone).is_at_most(10)
        expect(customer).to_not allow_value('(11)4433-1122').for(:phone)
        expect(customer).to_not allow_value('(011)4433-1122').for(:phone)
        expect(customer).to allow_value('44331122').for(:phone)
        expect(customer).to_not allow_value('118').for(:phone)
      end
    end

    context 'phone callbacks' do

      subject { Customer.new(name: "Ted", phone: "44366081",
        store: Customer::STORES.first) }
      before { subject.save }
      let(:errors) { subject.errors[:phone_ddd] }

      it 'validates phones format before save' do
        expect(errors.size).to eq(1)
        expect(errors).to include('não pode ficar em branco')
      end
    end
  end
end
