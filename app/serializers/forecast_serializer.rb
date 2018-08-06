class ForecastSerializer < ActiveModel::Serializer
  attributes :id, :lat, :long, :daily_precip_prob, :daily_precip_type
end
