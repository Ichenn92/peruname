class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: :search

  def search
    # Info to look at:
    #   address
    #   radius: default 5km
    #   shift(begin_time, end_time)
    #   category
    authorize @locations = Location.where.not(latitude: nil, longitude: nil)
    @performances = @locations.map { |location| location.performances }.flatten

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
      }
    end
  end

  def show; end
end
