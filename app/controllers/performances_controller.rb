class PerformancesController < ApplicationController
  include Pundit
  skip_before_action :authenticate_user!, only: [:search, :show]

  def search
    authorize @performances = Performance.search_near_performances_with_filter(params)

    set_markers
  end

  def show
    authorize @performance = Performance.find(params[:id])
  end

  private

  def set_markers

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    if @performances
      @markers = @performances.map do |performance|
        {
          lat: performance.location.latitude,
          lng: performance.location.longitude,
        }
      end
    end
  end
end
