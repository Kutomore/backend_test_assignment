# frozen_string_literal: true

describe UserPreferredBrand do
  it { is_expected.to belong_to :brand }
  it { is_expected.to belong_to :user }
end
