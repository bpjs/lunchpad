# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member_community, :class => 'MemberCommunity' do
    member nil
    community nil
  end
end
