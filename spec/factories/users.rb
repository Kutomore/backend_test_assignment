# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    preferred_price_range { 1000..2000 }

    factory :user_with_preferred_brands do
      transient do
        preferred_brands_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:user_preferred_brand, evaluator.preferred_brands_count, user: user)
      end
    end
  end
end
