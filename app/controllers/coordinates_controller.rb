class CoordinatesController < ApplicationController
  # before_action :set_coordinate, only: [:show, :update, :destroy]

  # GET /coordinates
  def index
    name = params['query']['name']
    region = params['query']['region']
    # ?locate=Boston&json=1
    @coordinates = HTTParty.get("https://geocode.xyz/?locate=#{name}&region=#{region}&json=1&strictmode=1")
    render json: @coordinates
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinate
      # @coordinate = Coordinate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def coordinate_params
      params.require(:coordinate).permit(:name)
    end
end
