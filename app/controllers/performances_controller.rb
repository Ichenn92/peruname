class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: :search

  def search
    # Info to look at:
    #   address
    #   radius: default 5km
    #   shift(begin_time, end_time)
    #   category
    @performances = Performance.near(params[:location])
    authorize @performances

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @performances.geocoded.map do |performance|
      {
        lat: performance.latitude,
        lng: performance.longitude,
      }
    end
  end

  private

  def params_search_performances
    params.require(:performance).permit(:address, :radius, :begin_time, :end_time, :character_category)
  end
end
