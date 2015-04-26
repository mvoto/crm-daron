require 'rails_helper'

RSpec.describe DevicesController, type: :controller do

  let(:customer)        { create(:customer) }
  let(:existing_device) { create(:device, customer_id: customer.id) }
	let(:new_device) 		  { double(:device) }

  describe "GET new" do
  	login_user

  	before do
      allow(Device).to receive(:new).and_return(new_device)
      allow(Customer).to receive(:find).with(customer.id.to_s)
        .and_return(customer)
      allow(customer).to receive_message_chain(:devices, :build)
    end


    it "returns http success" do
    	expect(response).to have_http_status(:success)

      get :new, device: { customer_id: customer.id }
    end
  end

  describe "GET edit" do
  	login_user

  	before do
    	allow(Device).to receive(:find).with(existing_device.id)
				.and_return(existing_device)
      allow(Device).to receive(:find).with(existing_device.id.to_s)
        .and_return(existing_device)
  	end

    it "returns http success" do
      expect(response).to have_http_status(:success)

      get :edit, id: existing_device.id
    end
  end
end
