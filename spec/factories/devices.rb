FactoryGirl.define do
  factory :device do
    _type 'CIC'
    ear 'Direito'
    battery '10'
    serial_number '123123'
    warantee 2
    store 'Unidade I - Santo André'
    brand 'Samsung'
    model 'xpto-1.0'
    purchased_at { Faker::Time.between(1.years.ago, Time.current, :all) }
  end
end
