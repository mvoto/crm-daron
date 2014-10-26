require 'rails_helper'

RSpec.describe "customers/index", :type => :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :le_lost_type => "Le Lost Type",
        :re_lost_type => "Re Lost Type",
        :le_device_type => "Le Device Type",
        :re_device_type => ""
      ),
      Customer.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :le_lost_type => "Le Lost Type",
        :re_lost_type => "Re Lost Type",
        :le_device_type => "Le Device Type",
        :re_device_type => ""
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Le Lost Type".to_s, :count => 2
    assert_select "tr>td", :text => "Re Lost Type".to_s, :count => 2
    assert_select "tr>td", :text => "Le Device Type".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
