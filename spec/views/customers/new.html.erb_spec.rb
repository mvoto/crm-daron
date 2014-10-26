require 'rails_helper'

RSpec.describe "customers/new", :type => :view do
  before(:each) do
    assign(:customer, Customer.new(
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :le_lost_type => "MyString",
      :re_lost_type => "MyString",
      :le_device_type => "MyString",
      :re_device_type => ""
    ))
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      assert_select "input#customer_name[name=?]", "customer[name]"

      assert_select "input#customer_email[name=?]", "customer[email]"

      assert_select "input#customer_phone[name=?]", "customer[phone]"

      assert_select "input#customer_le_lost_type[name=?]", "customer[le_lost_type]"

      assert_select "input#customer_re_lost_type[name=?]", "customer[re_lost_type]"

      assert_select "input#customer_le_device_type[name=?]", "customer[le_device_type]"

      assert_select "input#customer_re_device_type[name=?]", "customer[re_device_type]"
    end
  end
end
