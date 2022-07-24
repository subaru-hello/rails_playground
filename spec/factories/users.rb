# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "name_#{n}" }
    sequence(:email) { |n| "email_#{n}@example.com" }
  end
end
