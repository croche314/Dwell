require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :tenant => nil,
        :landlord => nil,
        :name => "Name",
        :primary => false,
        :account_type => "Account Type",
        :card_type => "Card Type",
        :account_number => "Account Number"
      ),
      Account.create!(
        :tenant => nil,
        :landlord => nil,
        :name => "Name",
        :primary => false,
        :account_type => "Account Type",
        :card_type => "Card Type",
        :account_number => "Account Number"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Account Type".to_s, :count => 2
    assert_select "tr>td", :text => "Card Type".to_s, :count => 2
    assert_select "tr>td", :text => "Account Number".to_s, :count => 2
  end
end
