require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "PartyBoy200#{n}" }
    sequence(:email) { |n| "party#{n}eva@launchacademy.com" }
    profile_picture 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/5c/5cd3cdae01e76fa0ad460e1573ea030a07bb4dd7_full.jp'
    sequence(:password) { |n| "123#{n}4567" }
    
  end

  factory :devtool do
    sequence(:title) { |n| "Tool #{n}" }
    sequence(:body) { |n| "This is a body #{n}" }
    sequence(:github_link) { |n| "githubissocool@#{n}" }
    sequence(:id) { |n| n}
    sequence(:user_id) { |n| n }
  end

  factory :review do
    sequence(:title) { |n| "Best thing ever!!#{n}!!" }
    sequence(:body) { |n| "I love this dev tool for reasons #{n}" }
    sequence(:devtool_id) { |n| n }
    sequence(:rating) { rand(1..5) }
    devtool
  end
end
