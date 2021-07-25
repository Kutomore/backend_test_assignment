# frozen_string_literal: true

describe CarRecommendationSerializer do
  let(:car) {
    FactoryBot.create(:car)
    Car.all.select('*, NULL as rank_score').first
  }
  let(:serialized_car){ CarRecommendationSerializer.new(car) }
  let(:expected_json) {
    {
      id: car.id,
      brand: {
        id: car.brand_id,
        name: car.brand.name
      },
      model: car.model,
      price: car.price,
      rank_score: 10,
      label: nil
    }.to_json
  }

  describe "#to_json" do
    before do
      car.rank_score = 10
    end

    it "matches the expected output" do
      expect(serialized_car.to_json).to eq(expected_json)
    end
  end
end
