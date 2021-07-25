class Car < ApplicationRecord
  belongs_to :brand

  enum label: { perfect_match: 0,  good_match: 1}

  scope :with_brand, -> (query) { joins(:brand).where("brands.name ilike ?", "%#{query}%") unless query.blank? }
  scope :with_price, -> (price_min = nil, price_max = nil) {
    if price_min && price_max
      where(price: [price_min..price_max])
    elsif price_min
      where('price > ?', price_min)
    elsif price_max
      where('price < ?', price_max)
    end
  }
end
