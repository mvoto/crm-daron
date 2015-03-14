FactoryGirl.define do
  factory :customer do
    name  { Faker::Name.name }
    email { Faker::Internet.email }
    phone_ddd '11'
    phone '44300390'
    purchased_at { Faker::Time.between(1.years.ago, Time.current, :all) }
    store 'Unidade I - Santo André'
    gender true
  end

  factory :person, parent: :customer, class: 'Person' do
    rg '418757896' # fake rg: 41.875.789-6
    cpf '85198228788' # fake cpf: 851.982.287-88
    dob { Faker::Time.between(80.years.ago, 30.years.ago, :all) }
    cellphone_ddd '11'
    cellphone '944300390'
  end

  factory :company, parent: :customer, class: 'Company' do
    cnpj '44837051000148' # fake cnpj: 44.837.051/0001-48
    state_registration { Faker::Company.name }
  end

  trait :with_address do
    address
  end

end
