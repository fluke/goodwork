# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :donation do
    name "MyString"
    address1 "MyString"
    address2 "MyString"
    city "MyString"
    state "MyString"
    category "MyString"
    status "MyString"
    ngo_id 1
    ph_no "MyString"
    email "MyString"
    description "MyString"
  end
end
