class CoordinatesController < ApplicationController
  # before_action :set_coordinate, only: [:show, :update, :destroy]

  # GET /coordinates
  def index
    name = params['name']
    # ?locate=Boston&json=1
    @coordinates = HTTParty.get("https://geocoder.ca/?locate=#{name}&json=1&standard=1&topmatches=1&strictmode=1")
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
