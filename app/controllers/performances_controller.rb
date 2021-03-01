class PerformancesController < ApplicationController
  include Pundit
  skip_before_action :authenticate_user!, only: [:search, :show]

  def show
    authorize @performance = Performance.find(params[:id])
  end

  def search
    authorize @all_locations = Location.near(params[:address], 5) # default radius of 5km

    if params[:performance][:character_category].present?
      @performances = get_performances_from_locations_by_character_category
      @locations = get_locations_from_performances
    else
      @locations = @all_locations
      @performances = get_all_performances_from_locations
    end

    set_markers
  end

  def show
    authorize @performance = Performance.find(params[:id])
  end

  private

  def set_markers

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    if @locations
      @markers = @locations.map do |location|
        {
          lat: location.latitude,
          lng: location.longitude,
        }
      end
    end
  end

  def get_locations_from_performances
    if @performances
      @performances.map { |performance| performance.location }
    end
  end

  def get_all_performances_from_locations
    if @locations
      @locations.map { |location| location.performances }.flatten
    end
  end

  def get_performances_from_locations_by_character_category
    if @all_locations
      @all_locations.map do |location|
        performances = location.performances
        performances.select do |performance|
          performance.character_category.id.to_s === params[:performance][:character_category]
        end
      end.flatten
    end
  end
end
