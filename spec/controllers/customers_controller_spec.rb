require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

	let(:existing_customer) { create(:customer) }
	let(:new_customer) { double(:customer) }
	let(:devices) { double(:devices) }

  describe "GET index" do

  	login_user

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do

  	login_user
  	before do
    	allow(Customer).to receive(:new).and_return(new_customer)
    	allow(new_customer).to receive(:build_address).and_return(new_customer)
    	allow(new_customer).to receive(:devices).twice.and_return(devices)
  	end


    it "returns http success" do
    	expect(devices).to receive(:build).twice
    	expect(response).to have_http_status(:success)

      get :new
    end
  end

  describe "GET edit" do

  	login_user
  	before do
    	allow(Customer).to receive(:find).with(existing_customer.id.to_s).and_return(existing_customer)
    	allow(existing_customer).to receive(:devices).exactly(3).times.and_return(devices)
    	allow(devices).to receive(:empty?).and_return(true)
  	end

    it "returns http success" do
    	expect(devices).to receive(:build).twice
      expect(response).to have_http_status(:success)

      get :edit, id: existing_customer.id
    end
  end

end
