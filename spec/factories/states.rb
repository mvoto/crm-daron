FactoryGirl.define do
  factory :state do
    acronym 'SP'
    name 'São Paulo'
    capital_id { create(:city).id }
  end

end
