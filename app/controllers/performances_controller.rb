class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: :search

  def search
    # Info to look at:
    #   address
    #   radius: default 5km
    #   shift(begin_time, end_time)
    #   category
    authorize @performances = Performance.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @performances.geocoded.map do |performance|
      {
        lat: performance.latitude,
        lng: performance.longitude,
      }
    end
  end
end
