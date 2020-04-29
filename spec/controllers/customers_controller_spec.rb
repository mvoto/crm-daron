require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

	let(:existing_customer) { create(:customer) }
	let(:new_customer) 		  { double(:customer) }

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
  	end


    it "returns http success" do
    	expect(response).to have_http_status(:success)

      get :new
    end
  end

  describe "GET edit" do

  	login_user
  	before do
    	allow(Customer).to receive(:find).with(existing_customer.id.to_s)
				.and_return(existing_customer)
  	end

    it "returns http success" do
      expect(response).to have_http_status(:success)

      get :edit, params: { id: existing_customer.id }
    end
  end

end
