class User < ApplicationRecord
  has_many :user_preferred_brands, dependent: :destroy
  has_many :preferred_brands, through: :user_preferred_brands, source: :brand

  def recommended_cars
    Car.select("
    *,
    CASE
      WHEN (brand_id IN (#{preferred_brands.ids.join(',')})) AND (price BETWEEN #{preferred_price_range.min} AND #{preferred_price_range.max}) THEN 0
      WHEN (brand_id IN (#{preferred_brands.ids.join(',')})) THEN 1
      ELSE 3
    END as label
    ")
  end
end
