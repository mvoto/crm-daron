require 'rails_helper'

feature 'Managing customers', %q{
  In order to manage customers
  I want to create, list, see and update company and person customers
} do

  let!(:customer) { create(:customer) }
  let!(:company) { create(:company) }
  let!(:person) { create(:person) }

  scenario 'displays expected columns' do
    visit customers_path

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)
    expect(page).to have_content(customer.store)
    expect(page).to have_content(customer.purchased_at.strftime('%d/%m/%Y'))
    expect(page).to have_content(customer.le_lost_type)
    expect(page).to have_content(customer.re_lost_type)
    expect(page).to have_content(customer.le_device_type)
    expect(page).to have_content(customer.re_device_type)
  end

  scenario 'person details' do
    visit customers_path

    click_link(person.name)
    expect(page).to have_content 'Cpf'
    expect(page).to have_content person.name
    expect(page).to have_content person.rg
    expect(page).to have_content person.cpf
    expect(page).to have_content person.dob.strftime('%d/%m/%Y')
  end

  scenario 'company details' do
    visit customers_path

    click_link(company.name)
    expect(page).to have_content 'Cnpj'
    expect(page).to have_content company.cnpj
    expect(page).to have_content company.state_registration
  end

  scenario 'creating person'
  scenario 'creating company'
  scenario 'updating person'
  scenario 'updating company'
  scenario 'destroying person'
end
