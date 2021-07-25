# frozen_string_literal: true

describe GetCarRecommendationsService do
  subject { GetCarRecommendationsService }

  describe '#self.perform' do
    let(:brands) { FactoryBot.create_list(:brand_with_cars, 4) }
    let(:user) { FactoryBot.create(:user) }
    let(:ai_response) do
      Car.all.shuffle.sample(10).map do |car|
        {
          'car_id' => car.id,
          'rank_score' => rand(0.1..0.9)
        }
      end
    end

    before do
      user.preferred_brands = [brands.first]
      user.save
      allow_any_instance_of(subject).to receive(:ai_recommendations).and_return(ai_response[0, 4])
    end

    context 'with no filtering parameters' do
      let(:params) { { user_id: user.id } }

      it 'returns a list of ordered car recommendations with all cars' do
        expect(subject.send(:perform, params).map(&:id).uniq.size).to eq(20)
      end
    end

    context 'when it gets filtered by brand' do
      let(:params) { { user_id: user.id, query: brands.first&.name } }

      it 'only includes cars from brands that match that name' do
        expect(subject.send(:perform, params).map { |car| car.brand.name }).to eq([].fill(brands.first&.name, 0, 5))
      end
    end

    context 'when it gets filtered by max price' do
      let(:params) { { user_id: user.id, price_max: 100_000 } }
      let!(:excluded_car) { FactoryBot.create(:car, price: 100_001) }

      it 'only includes cars with prices lower than the max' do
        expect(subject.send(:perform, params)).not_to include excluded_car
        expect(subject.send(:perform, params).map(&:id)).to include(*brands.map(&:car_ids).flatten)
      end
    end

    context 'when it gets filtered by min price' do
      let(:params) { { user_id: user.id, price_min: 10_000 } }
      let!(:excluded_car) { FactoryBot.create(:car, price: 9999) }

      it 'only includes cars with prices higher than the min' do
        expect(subject.send(:perform, params)).not_to include excluded_car
        expect(subject.send(:perform, params).map(&:id)).to include(*brands.map(&:car_ids).flatten)
      end
    end
  end
end
