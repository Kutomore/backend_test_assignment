class CarRecommendationsController < ApplicationController
  def index
    render json: Car.all, each_serializer: CarRecommendationSerializer
  end
end
