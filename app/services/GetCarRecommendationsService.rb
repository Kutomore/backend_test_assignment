class GetCarRecommendationsService
  def initialize(params)
    @params = params
    @user = User.find(params[:user_id])
  end

  def self.perform(params)
    self.new(params).send(:perform)
  end

  private

  def perform
    recommended_cars
  end

  def recommended_cars
    user.recommended_cars(ai_recommendations).with_brand(params[:query]).with_price(params[:price_min], params[:price_max]).order(:label, :rank_score, :price)
  end

  def ai_recommendations
    [{car_id: 179, rank_score: 0.999}]
  end

  attr_accessor :params, :user
end