class BrandSerializer < ActiveModel::Serializer
  type 'brand'

  attributes :id, :name
end