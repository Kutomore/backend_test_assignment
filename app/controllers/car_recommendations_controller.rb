# frozen_string_literal: true

class CarRecommendationsController < ApplicationController
  def index
    render json:
             GetCarRecommendationsService
               .perform(car_recommendations_params)
               .page(car_recommendations_params[:page])
               .per(20),
           each_serializer:
             CarRecommendationSerializer
  end

  private

  def car_recommendations_params
    params.require(:user_id)
    params.permit(:user_id, :query, :price_min, :price_max, :page)
  end
end
