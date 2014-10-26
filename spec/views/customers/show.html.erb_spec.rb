require 'rails_helper'

RSpec.describe "customers/show", :type => :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :name => "Name",
      :email => "Email",
      :phone => "Phone",
      :le_lost_type => "Le Lost Type",
      :re_lost_type => "Re Lost Type",
      :le_device_type => "Le Device Type",
      :re_device_type => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Le Lost Type/)
    expect(rendered).to match(/Re Lost Type/)
    expect(rendered).to match(/Le Device Type/)
    expect(rendered).to match(//)
  end
end
