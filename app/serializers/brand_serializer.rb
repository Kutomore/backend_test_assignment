# frozen_string_literal: true

class BrandSerializer < ActiveModel::Serializer
  type 'brand'

  attributes :id, :name
end
