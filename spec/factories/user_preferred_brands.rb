# frozen_string_literal: true

FactoryBot.define do
  factory :user_preferred_brand do
    user
    brand
  end
end
