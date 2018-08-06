class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :lat, :long, :default
  has_one :user
end
