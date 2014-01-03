require 'faker'

FactoryGirl.define do
  sequence :random_string do |n|
    "#{n}-" + Faker::Lorem.sentence(6).chomp('.')
  end

  factory :user do
    sequence(:name, 50) { |n| "Joe Smith #{n}" }
    sequence(:nick_name, 50) { |n| "nick_joe_smith #{n}" }
    provider 'tweetbook'
    password 'secret'
    password_confirmation 'secret'
    sequence(:uid, 100)
  end

  factory :question do
    user
    title { "question #{generate :random_string}" }
    body  { Faker::Lorem.paragraphs(3).join('\n')}
  end
end
