require File.expand_path("../../spec/support/factory_girl_helper", __FILE__)

include FactoryGirlHelper

State.all.each_with_index do |state, i|
	address = FactoryGirl.create(:address, state_id: state.id,
		city_id: state.cities.first.id)

	person = find_or_create(:person, email: "test#{i}@example.com")
	person.address = address
	person.save

	company = find_or_create(:company, email: "test#{i}@example.com")
	company.address = address
	company.save
end
