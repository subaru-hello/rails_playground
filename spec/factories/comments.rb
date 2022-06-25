# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    sequence(:body) { |n| "test_#{n}" }
    association :user
    association :post
  end
end
