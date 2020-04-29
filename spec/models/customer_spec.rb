require 'rails_helper'

RSpec.describe Customer, type: :model do

  describe 'Validations:' do

    let(:customer) { build(:customer) }

    it { should validate_presence_of(:name) }

    context 'given the phone' do

      it 'validates format and length' do
        expect(customer).to validate_length_of(:phone).is_at_most(10)
        expect(customer).to_not allow_value('(11)4433-1122').for(:phone)
        expect(customer).to_not allow_value('(011)4433-1122').for(:phone)
        expect(customer).to allow_value('44331122').for(:phone)
        expect(customer).to_not allow_value('118').for(:phone)
      end
    end

    context 'phone callbacks' do

      subject { Customer.new(name: "Ted", phone: "44366081") }
      before { subject.save }
      let(:errors) { subject.errors[:phone_ddd] }

      it 'validates phones format before save' do
        expect(errors.size).to eq(1)
        expect(errors).to include('não pode ficar em branco')
      end
    end
  end
end
