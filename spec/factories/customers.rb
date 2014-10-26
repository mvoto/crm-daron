FactoryGirl.define do
  factory :customer do
    name Faker::Name.name
    email Faker::Internet.email
    phone { Faker::PhoneNumber.phone_number }
    le_lost_type 'Moderada'
    re_lost_type 'Profunda'
    le_device_type 'CIC'
    re_device_type 'CIC'
    store 'Unidade I'
  end

end
