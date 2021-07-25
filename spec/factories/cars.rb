# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    model { Faker::Device.model_name }
    brand
    price { rand(10_000..100_000) }
  end
end
