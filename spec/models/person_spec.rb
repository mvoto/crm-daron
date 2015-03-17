require 'rails_helper'

RSpec.describe Person, type: :model do

    context 'Validations:' do
      let(:person) { build(:person) }

      context 'given the cellphone' do
        let(:customer) { build(:person) }

        it 'validates format and length' do
          expect(person).to_not allow_value('(11)94433-1122').for(:cellphone)
          expect(person).to_not allow_value('(011)94433-1122').for(:cellphone)
          expect(person).to allow_value('944331122').for(:cellphone)
          expect(person).to_not allow_value('118').for(:cellphone)
          expect(person).to ensure_length_of(:cellphone).is_at_most(10)
        end
      end

      context 'cellphone callbacks' do

        subject { Person.new(name: "Ted", cellphone: "976368299") }
        before { subject.save }
        let(:errors) { subject.errors[:cellphone_ddd] }

        it 'validates cellphone format before save' do
          expect(errors.size).to eq(1)
          expect(errors).to include('não pode ficar em branco')
        end
      end
    end
end
