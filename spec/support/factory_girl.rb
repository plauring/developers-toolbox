require 'factory_girl_rails'

FactoryGirl.define do

  factory :devtool do
    sequence(:title) { |n| "Tool #{n}" }
    sequence(:body) { |n| "This is a body #{n}" }
    sequence(:github_link) { |n| "githubissocool@#{n}" }
    sequence(:id) { |n| n}
  end

  factory :review do
    sequence(:title) { |n| "Best thing ever!!#{n}!!" }
    sequence(:body) { |n| "I love this dev tool for reasons #{n}" }
    sequence(:devtool_id) { |n| n }
    sequence(:rating) { rand(1..5) }
    devtool
  end
end
