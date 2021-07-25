class CarRecommendationsController < ApplicationController
  def index
    render json: GetCarRecommendationsService.perform(car_recommendations_params), each_serializer: CarRecommendationSerializer
  end

  private

  def car_recommendations_params
    params.require(:user_id)
    params.permit(:user_id, :query, :price_min, :price_max, :page)
  end
end
