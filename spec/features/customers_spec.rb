require 'rails_helper'

feature 'Managing customers', %q{
  In order to manage customers
  I want to create, list, see and update company and person customers
} do

  let!(:customer) { create(:customer, name: 'Abel da Silva') }
  let!(:company) { create(:company) }
  let!(:person) { create(:person, :with_address) }

  before { sign_in }

  context 'when listing customers' do

    scenario 'displays expected columns' do
      visit customers_path

      expect(page).to have_content(customer.name.truncate(15))
      expect(page).to have_content(customer.email.truncate(12))
      expect(page).to have_content(customer.phone)
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
    expect(page).to have_content person.observation
    expect(page).to have_content person.dob.strftime('%d/%m/%Y')
  end

  scenario 'company details' do
    visit customers_path

    click_link(company.name.truncate(15))
    expect(page).to have_content 'Cnpj'
    expect(page).to have_content company.cnpj
    expect(page).to have_content company.state_registration
  end

  scenario 'creating a customer', js: true do
    visit customers_path

    click_link('Novo')
    fill_in('customer_name', with: 'Ronaldo Brito')
    fill_in('customer_email', with: 'ronaldo.brito@hotmail.com')
    fill_in('customer_phone_ddd', with: '11')
    fill_in('customer_phone', with: '976368299')
    choose('customer_gender_true')

    select('São Paulo', from: 'Estado')
    page.find("#mainButton").trigger("click")
    expect(page).to have_content 'Criado com sucesso'
  end

  scenario 'updating a customer' do
    visit customers_path

    click_button('Editar', match: :first)
    fill_in('customer_name', with: 'Ronaldo Brito')
    select('São Paulo', from: 'Estado')
    page.find("#mainButton").click
    expect(page).to have_content 'Alteração feita com sucesso'
  end

  scenario 'destroying a customer' do
    visit customers_path

    expect(page).to have_css '.btn'
  end

  context 'given logged user is an admin' do
    before { allow(@user).to receive(:admin?).and_return(true) }
    scenario 'destroying a customer' do
      visit customers_path

      page.first('button.btn-danger').click
      expect(page).to have_content 'Excluído com sucesso'
    end
  end
end
