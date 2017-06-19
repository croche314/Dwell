require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :tenant => nil,
      :landlord => nil,
      :name => "Name",
      :primary => false,
      :account_type => "Account Type",
      :card_type => "Card Type",
      :account_number => "Account Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Account Type/)
    expect(rendered).to match(/Card Type/)
    expect(rendered).to match(/Account Number/)
  end
end
