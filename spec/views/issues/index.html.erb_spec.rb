require 'rails_helper'

RSpec.describe "issues/index", type: :view do
  before(:each) do
    assign(:issues, [
      Issue.create!(
        :tenant => nil,
        :unit => nil,
        :category => "Category",
        :description => "MyText",
        :urgency => 2
      ),
      Issue.create!(
        :tenant => nil,
        :unit => nil,
        :category => "Category",
        :description => "MyText",
        :urgency => 2
      )
    ])
  end

  it "renders a list of issues" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
