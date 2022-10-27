# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    sequence(:body) { |n| "post_body#{n}" }
    sequence(:title) { |n| "title_#{n}" }
    association :user
  end
end
