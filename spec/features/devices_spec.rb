require 'rails_helper'

feature 'Managing devices', %q{
  In order to manage devices
  I want to create, list and update customer's devices
} do

  let!(:customer) { create(:customer, name: 'Abel da Silva') }
  let!(:device)   { create(:device, customer_id: customer.id) }

  before { sign_in }

  context 'when listing devices' do

    scenario 'displays expected columns' do
      visit customer_path(customer.id)

      expect(page).to have_content(device._type)
      expect(page).to have_content(device.ear)
      expect(page).to have_content(device.model)
      expect(page).to have_content(device.main_store)
      expect(page).to have_content(device.battery)
      expect(page).to have_content(device.serial_number)
      expect(page).to have_content(device.warantee)
    end
  end

  scenario 'creating a device', js: true do
    visit customer_path(customer.id)

    click_link('Novo')
    select('Direito', from: 'device_ear')
    select('CIC', from: 'device__type')
    fill_in('device_brand', with: 'Marca 123')
    fill_in('device_model', with: 'Modelo 123')
    select('Unidade I - Santo André', from: 'device_store')
    fill_in('device_serial_number', with: '123123')
    select('13', from: 'device_battery')
    fill_in('device_warantee', with: 2)

    page.find("#mainButton").trigger("click")
    expect(page).to have_content 'Criado com sucesso'
  end

  scenario 'updating a device', js: true do
    visit customer_path(customer.id)

    within('table') { click_link('Editar', match: :first) }
    select('Esquerdo', from: 'device_ear')
    fill_in('device_brand', with: 'Marca 321')
    page.find("#mainButton").trigger("click")
    expect(page).to have_content 'Alteração feita com sucesso'
  end

  scenario 'destroying a device' do
    visit customer_path(customer.id)

    click_link('Excluir', match: :first)
    expect(page).to have_content 'Excluído com sucesso'
  end
end
