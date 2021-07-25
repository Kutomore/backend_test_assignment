# frozen_string_literal: true

describe BrandSerializer do
  let(:brand) {FactoryBot.create(:brand_with_cars)}
  let(:serialized_brand){ BrandSerializer.new(brand) }
  let(:expected_json) {
    {
      id: brand.id,
      name: brand.name
    }.to_json
  }

  describe "#to_json" do
    it "matches the expected output" do
      expect(serialized_brand.to_json).to eq(expected_json)
    end
  end
end
