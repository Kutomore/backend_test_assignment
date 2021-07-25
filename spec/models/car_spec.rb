# frozen_string_literal: true

describe Car do
  it { is_expected.to belong_to :brand }
  # it { is_expected.to define_enum_for :label } the current implementation is currently impossible to test with shoulda-matchers

  it 'defines a enum for label' do
    expect(Car.defined_enums.keys).to include('label')
  end

  describe '#with_brand' do
    let(:brand) { FactoryBot.create(:brand_with_cars) }
    let(:excluded_car) { FactoryBot.create(:car) }

    context 'when a brand is passed' do
      it 'returns the cars from the included brand' do
        expect(Car.with_brand(brand.name).ids).to include(*brand.cars.ids)
      end

      it "doesn't return the cars from any other brand" do
        expect(Car.with_brand(brand.name).ids).not_to include excluded_car
      end
    end

    context 'when no brand is passed' do
      it 'returns all cars' do
        expect(Car.with_brand.ids).to eq(Car.all.ids)
      end
    end
  end

  describe '#with_price' do
    let!(:cheap_cars) { FactoryBot.create_list(:car, 5, price: rand(1000..10_000)) }
    let!(:average_cars) { FactoryBot.create_list(:car, 5, price: rand(10_000..100_000)) }
    let!(:expensive_cars) { FactoryBot.create_list(:car, 5, price: rand(100_000..200_000)) }

    context 'when both minimum and maximum price are passed' do
      it 'returns the cars within that price range' do
        expect(Car.with_price(10_000, 100_000).ids).to include(*average_cars.map(&:id))
      end

      it "doesn't return the cars outside that price range" do
        expect(Car.with_price(10_000, 100_000).ids).not_to include(*(cheap_cars.map(&:id) + expensive_cars.map(&:id)))
      end
    end

    context 'when only maximum price is passed' do
      it 'returns the cars within that price range' do
        expect(Car.with_price(nil, 100_000).ids).to include(*(cheap_cars.map(&:id) + average_cars.map(&:id)))
      end

      it "doesn't return the cars outside that price range" do
        expect(Car.with_price(nil, 100_000).ids).not_to include(*expensive_cars.map(&:id))
      end
    end

    context 'when only minimum price is passed' do
      it 'returns the cars within that price range' do
        expect(Car.with_price(10_000, nil).ids).to include(*(average_cars.map(&:id) + expensive_cars.map(&:id)))
      end

      it "doesn't return the cars outside that price range" do
        expect(Car.with_price(10_000, nil).ids).not_to include(*cheap_cars.map(&:id))
      end
    end

    context 'when no argument is passed' do
      it 'returns all cars' do
        expect(Car.with_price.ids).to eq(Car.all.ids)
      end
    end
  end
end
