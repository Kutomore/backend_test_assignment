# frozen_string_literal: true

describe User do
  it { is_expected.to have_many(:user_preferred_brands).dependent(:destroy) }
  it { is_expected.to have_many(:preferred_brands).through(:user_preferred_brands).source(:brand) }

  describe '#recommended_cars' do
    let!(:user) { FactoryBot.create(:user_with_preferred_brands) }
    let!(:perfect_matches) do
      FactoryBot.create_list(:car, 2, brand: user.preferred_brands.sample, price: rand(user.preferred_price_range))
    end
    let!(:good_matches) { FactoryBot.create_list(:car, 3, brand: user.preferred_brands.sample) }
    let!(:other_cars) { FactoryBot.create_list(:car, 25) }
    let!(:ai_recommendations) do
      (perfect_matches[1, 2] + good_matches[0, 1] + other_cars).sample(9).map do |car|
        { 'car_id' => car.id, 'rank_score' => rand(0.1..0.9) }
      end
    end

    it 'includes the value for the rank_score' do
      expect(
        user.recommended_cars(ai_recommendations).select do |car|
          ai_recommendations.map { |recommendation| recommendation['car_id'] }.include? car.id
        end.map(&:rank_score)
      ).not_to include nil
    end
  end
end
