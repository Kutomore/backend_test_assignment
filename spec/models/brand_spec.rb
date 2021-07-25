# frozen_string_literal: true

describe Brand do
  it { is_expected.to have_many(:cars).dependent(:destroy) }
end
