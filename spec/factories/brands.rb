# frozen_string_literal: true

FactoryBot.define do
  factory :brand do
    name { Faker::Company.name }

    factory :brand_with_cars do
      transient do
        cars_count { 5 }
      end

      after(:create) do |brand, evaluator|
        create_list(:car, evaluator.cars_count, brand: brand)
      end
    end
  end
end
