require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :tenant => nil,
      :landlord => nil,
      :name => "MyString",
      :primary => false,
      :account_type => "MyString",
      :card_type => "MyString",
      :account_number => "MyString"
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input#account_tenant_id[name=?]", "account[tenant_id]"

      assert_select "input#account_landlord_id[name=?]", "account[landlord_id]"

      assert_select "input#account_name[name=?]", "account[name]"

      assert_select "input#account_primary[name=?]", "account[primary]"

      assert_select "input#account_account_type[name=?]", "account[account_type]"

      assert_select "input#account_card_type[name=?]", "account[card_type]"

      assert_select "input#account_account_number[name=?]", "account[account_number]"
    end
  end
end
