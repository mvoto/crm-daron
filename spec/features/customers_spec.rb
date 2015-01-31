require 'rails_helper'

feature 'Managing customers', %q{
  In order to manage customers
  I want to create, list, see and update company and person customers
} do

  let!(:customer) { create(:customer, name: 'Abel da Silva') }
  let!(:company) { create(:company) }
  let!(:person) { create(:person, :with_address) }

  context 'when listing customers' do

    scenario 'displays expected columns' do
      visit customers_path

      expect(page).to have_content(customer.name.truncate(15))
      expect(page).to have_content(customer.email.truncate(12))
      expect(page).to have_content(customer.phone)
      expect(page).to have_content(customer.store)
      expect(page).to have_content(customer.purchased_at.strftime('%d/%m/%Y'))
      expect(page).to have_content(customer.le_lost_type)
      expect(page).to have_content(customer.re_lost_type)
      expect(page).to have_content(customer.le_device_type)
      expect(page).to have_content(customer.re_device_type)
    end

    let!(:customers) { create_list(:customer, 20) }
    scenario 'paginating customers' do
      visit customers_path
      expect(page).to have_content(Customer.order(:name).first.name)
      expect(page).to_not have_content(Customer.order(:name).last.name)
    end
  end

  scenario 'person details' do
    visit customers_path

    click_link(person.name.truncate(15))
    expect(page).to have_content 'CPF'
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

  scenario 'creating a customer', js: true do
    visit customers_path

    click_link('Novo')
    fill_in('customer_name', with: 'Ronaldo Brito')
    fill_in('customer_email', with: 'ronaldo.brito@hotmail.com')
    fill_in('customer_phone', with: '11 976368299')
    select('Unidade I', from: 'customer_store')

    select('São Paulo', from: 'Estado')
    click_button('Criar Cliente')
    expect(page).to have_content 'Criado com sucesso'
  end

  scenario 'updating a customer' do
    visit customers_path

    click_link('Editar', match: :first)
    fill_in('customer_name', with: 'Ronaldo Brito')
    select('São Paulo', from: 'Estado')
    click_button('Atualizar Cliente')
    expect(page).to have_content 'Alteração feita com sucesso'
  end

  scenario 'destroying a customer' do
    visit customers_path

    click_link('Excluir', match: :first)
    expect(page).to have_content 'Excluído com sucesso'
  end
end
