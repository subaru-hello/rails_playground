# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    sequence(:body) { |n| "post_body#{n}" }
    association :user
  end
end
