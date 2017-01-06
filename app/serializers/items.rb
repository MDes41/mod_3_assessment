class Api::V1::ItemsSerializer < ActiveModel::Serializer
  attribute :name, :description, :image_url
end