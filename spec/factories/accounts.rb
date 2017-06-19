FactoryGirl.define do
  factory :account do
    tenant nil
    landlord nil
    name "MyString"
    primary false
    account_type "MyString"
    card_type "MyString"
    account_number "MyString"
    expiration "2017-06-18"
  end
end
