# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    name "MyString"
    category "MyString"
    yelp_url "MyString"
    address "MyString"
    community nil
  end
end
