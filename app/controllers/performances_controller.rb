class PerformancesController < ApplicationController
  include Pundit
  skip_before_action :authenticate_user!, only: [:search, :show]
  skip_after_action :verify_authorized, only: [:search, :show]

  def search
    @performances = Performance.search_near_performances_with_filter(params)

    return no_result_found if @performances.empty?

    result_found
    set_markers
  end

  def show
    authorize @performance = Performance.find(params[:id])
    authorize @booking = Booking.new
  end

  def new
    if current_user.actor?
      authorize @performance = Performance.new
    end
  end

  def create
    if current_user.actor?
      @character = Character.find(performance_params[:character_id].to_i) unless performance_params[:character_id].blank?
      @character_category = CharacterCategory.find(performance_params[:character_category].to_i) unless performance_params[:character_category].blank?
      @performance_category = PerformanceCategory.find(performance_params[:performance_category_id].to_i) unless performance_params[:performance_category_id].blank?
      @description = performance_params[:description] unless performance_params[:description].blank?
      @location = Location.find_by_name(performance_params[:location].split(" / ").first) unless performance_params[:location].blank?
      @price_per_hour = performance_params[:price_per_hour] unless performance_params[:price_per_hour].blank?

      authorize @performance = Performance.new({ description: @description,
                                                 price_per_hour: @price_per_hour,
                                                 character: @character,
                                                 character_category: @character_category,
                                                 performance_category: @performance_category,
                                                 location: @location,
                                                 user: current_user })
      current_user.actor = current_user.performances.count > 0
      if @performance.save
        redirect_to performance_path(@performance)
      else
        render :new
      end
    end
  end

  private

  def no_result_found
    flash[:alert] = "No result found with those parameters"
    redirect_back fallback_location: root_path
    # render "pages/home"
  end

  def result_found
    flash[:success] = "Matches found!"
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
    params.require(:performance).permit(:character_id, :character_category, :performance_category_id, :location, :description, :price_per_hour)
  end
end
