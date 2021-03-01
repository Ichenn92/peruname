class PerformancesController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: [:show]
  skip_before_action :authenticate_user!, only: :search

  def show
    @performance = Performance.find(params[:id])
  end

  def search
    # Info to look at:
    #   address
    #   radius: default 5km
    #   shift(begin_time, end_time)
    #   category
    authorize @locations = Location.near(params[:location], 5)
    @performances = @locations.map { |location| location.performances }.flatten

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
      }
  end
end
