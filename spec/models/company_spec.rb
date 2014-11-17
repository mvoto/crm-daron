require 'rails_helper'

RSpec.describe Company, type: :model do

    context 'Validations:' do
      let(:company) { build(:company) }

      it 'validates presence of cnpj' do
        expect(company).to validate_presence_of(:cnpj)
      end
    end
end
