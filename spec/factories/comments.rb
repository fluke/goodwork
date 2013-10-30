# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    data "MyString"
    ngo_id 1
    donation_id 1
  end
end
