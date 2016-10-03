require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "PartyBoy200#{n}" }
    sequence(:email) { |n| "partyboy200#{n}@example.com"}
  end

  factory :dev_tool do
    sequence(:title) { |n| "Tool #{n}" }
  end
end
