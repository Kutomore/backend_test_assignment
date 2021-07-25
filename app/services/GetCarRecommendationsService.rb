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
    user.recommended_cars.order(:label, :price).with_brand(params[:query]).with_price(params[:price_min], params[:price_max])
  end

  attr_accessor :params, :user
end