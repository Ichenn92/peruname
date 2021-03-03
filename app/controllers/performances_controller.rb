class PerformancesController < ApplicationController
  include Pundit
  skip_before_action :authenticate_user!, only: [:search, :show]
  skip_after_action :verify_authorized, only: [:search, :show]

  def search
    @performances = Performance.search_near_performances_with_filter(params)

    return no_result_found if @performances.empty?

    set_markers
  end

  def show
    authorize @performance = Performance.find(params[:id])
  end

  def new
    if current_user.actor?
      authorize @performance = Performance.new
    end
  end

  def create
    if current_user.actor?
      @character_category = CharacterCategory.find_by_name(performance_params[:character_category])
      if @character_category.nil?
        CharacterCategory.create!(name: performance_params[:character_category])
        @character_category = CharacterCategory.find_by_name(performance_params[:character_category])
      end
      @character = Character.find_by_name(performance_params[:character])
      if @character.nil?
        Character.create!(name: performance_params[:character], character_category: @character_category)
        @character = Character.find_by_name(performance_params[:character])
      end
      @performance_category = PerformanceCategory.find_by_name(performance_params[:performance_category])
      if @performance_category.nil?
        PerformanceCategory.create!(name: performance_params[:performance_category])
        @performance_category = PerformanceCategory.find_by_name(performance_params[:performance_category])
      end
      @location = Location.find_by_address(performance_params[:location])
      if @location.nil?
        Location.create!(address: performance_params[:location])
        @location = Location.find_by_address(performance_params[:location])
      end
      authorize @performance = Performance.new({ description: performance_params[:description],
                                                     price_per_hour: performance_params[:price_per_hour],
                                                     character: @character,
                                                     performance_category: @performance_category,
                                                     location: @location,
                                                     user: current_user })
      @performance.save
    end
    redirect_to performance_path(@performance)
  end

  private

  def no_result_found
    flash.now[:alert] = "No result found"
    render "pages/home"
  end

  def set_markers # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    if @performances
      @markers = @performances.map do |performance|
        {
          lat: performance.location.latitude,
          lng: performance.location.longitude,
          infowindow: render_to_string(partial: "info_window", locals: { performance: performance }),
        }
      end
    end
  end

  def performance_params
    params.require(:performance).permit(:description, :price_per_hour, :character, :performance_category, :location, )
  end
end
