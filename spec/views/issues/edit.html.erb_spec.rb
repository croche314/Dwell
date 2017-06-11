require 'rails_helper'

RSpec.describe "issues/edit", type: :view do
  before(:each) do
    @issue = assign(:issue, Issue.create!(
      :tenant => nil,
      :unit => nil,
      :category => "MyString",
      :description => "MyText",
      :urgency => 1
    ))
  end

  it "renders the edit issue form" do
    render

    assert_select "form[action=?][method=?]", issue_path(@issue), "post" do

      assert_select "input#issue_tenant_id[name=?]", "issue[tenant_id]"

      assert_select "input#issue_unit_id[name=?]", "issue[unit_id]"

      assert_select "input#issue_category[name=?]", "issue[category]"

      assert_select "textarea#issue_description[name=?]", "issue[description]"

      assert_select "input#issue_urgency[name=?]", "issue[urgency]"
    end
  end
end
