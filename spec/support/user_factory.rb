require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "PartyBoy200#{n}" }
    sequence(:email) { |n| "party#{n}eva@launchacademy.com" }
    profile_picture "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/5c/5cd3cdae01e76fa0ad460e1573ea030a07bb4dd7_full.jpg"
    sequence(:password) {|n| "123#{n}4567"}
  end
end
