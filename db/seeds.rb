require File.expand_path('../spec/support/factory_girl_helper.rb', __dir__)

FactoryGirl.create(:user, email: 'daron@daron.com.br', password: 'daron2015', confirmed_at: DateTime.now, role: User::ADMIN)

State.all.each_with_index do |state, i|
  address = FactoryGirl.create(:address, state_id: state.id, city_id: state.cities.first.id)

  person = FactoryGirlHelper.find_or_create(:person, email: "test#{i}@example.com")
  person.address = address
  person.save

  company = FactoryGirlHelper.find_or_create(:company, email: "test#{i}@example.com")
  company.address = address
  company.save
end
