require 'rails_helper'

RSpec.describe "issues/new", type: :view do
  before(:each) do
    assign(:issue, Issue.new(
      :tenant => nil,
      :unit => nil,
      :category => "MyString",
      :description => "MyText",
      :urgency => 1
    ))
  end

  it "renders new issue form" do
    render

    assert_select "form[action=?][method=?]", issues_path, "post" do

      assert_select "input#issue_tenant_id[name=?]", "issue[tenant_id]"

      assert_select "input#issue_unit_id[name=?]", "issue[unit_id]"

      assert_select "input#issue_category[name=?]", "issue[category]"

      assert_select "textarea#issue_description[name=?]", "issue[description]"

      assert_select "input#issue_urgency[name=?]", "issue[urgency]"
    end
  end
end
