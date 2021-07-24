class CarRecommendationSerializer < ActiveModel::Serializer
  type 'car_recommendation'

  attributes :id, :brand, :model, :price, :rank_score, :label

  belongs_to :brand
end