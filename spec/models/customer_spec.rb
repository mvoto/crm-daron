require 'rails_helper'

RSpec.describe Customer, type: :model do

    context "Validations" do
      [:name, :store].each do |attribute|
        it { should validate_presence_of(attribute) }
      end
    end
end
