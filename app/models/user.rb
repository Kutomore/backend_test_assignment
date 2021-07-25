class User < ApplicationRecord
  has_many :user_preferred_brands, dependent: :destroy
  has_many :preferred_brands, through: :user_preferred_brands, source: :brand

  def recommended_cars(ai_recommendations)
    Car.select("
    *,
    CASE
      WHEN (brand_id IN (#{preferred_brands.ids.join(',')})) AND (price BETWEEN #{preferred_price_range.min} AND #{preferred_price_range.max}) THEN 0
      WHEN (brand_id IN (#{preferred_brands.ids.join(',')})) THEN 1
      ELSE 2
    END as label
    #{
      unless ai_recommendations.blank?
        ",CASE
          #{ai_recommendations.map{ |recommendation| "WHEN cars.id = #{recommendation[:car_id]} THEN #{recommendation[:rank_score]}" }&.join(',')&.tr(',', ' ')}
        END as rank_score"
      end
    }
    ")
  end
end
