FactoryGirl.define do
  factory :issue do
    tenant nil
    unit nil
    category "MyString"
    description "MyText"
    urgency 1
  end
end
