class StoreIndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :motto, :product, :price
end
