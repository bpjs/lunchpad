# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    text "MyString"
    rating 1.5
    restaurant nil
    member nil
  end
end
