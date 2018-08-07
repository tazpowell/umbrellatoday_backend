class ForecastsController < ApplicationController
  # before_action :set_example, only: %i[update destroy]

  # GET /forecasts
  def index
    lat = params['location']['lat']
    long = params['location']['long']
    api_key = ENV['DARKSKY_API_KEY']
    @forecasts = HTTParty.get("https://api.darksky.net/forecast/#{api_key}/#{lat},#{long}?exclude=currently,minutely,hourly,alerts,flags")
    render json: @forecasts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forecast
      # @forecast = Forecast.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def forecast_params
      params.require(:forecast).permit(:lat, :long, :daily_precip_prob, :daily_precip_type)
    end
end
