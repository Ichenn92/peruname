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

  def index
    @performances = policy_scope(Performance).all_my_performances(current_user)
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
      @photo = performance_params[:photo] unless performance_params[:photo].blank?

      authorize @performance = Performance.new({ description: @description,
                                                 price_per_hour: @price_per_hour,
                                                 character: @character,
                                                 character_category: @character_category,
                                                 performance_category: @performance_category,
                                                 location: @location,
                                                 user: current_user })
      current_user.actor = current_user.performances.count > 0
      if @performance.save
        @performance.photos.attach(@photo)
        redirect_to performance_path(@performance)
      else
        render :new
      end
    end
  end

  def edit
    if current_user.actor?
      authorize @performance = Performance.find(params[:id])
    end
  end

  def update
    @character = Character.find(performance_params[:character_id].to_i) unless performance_params[:character_id].blank?
    @character_category = CharacterCategory.find(performance_params[:character_category].to_i) unless performance_params[:character_category].blank?
    @performance_category = PerformanceCategory.find(performance_params[:performance_category_id].to_i) unless performance_params[:performance_category_id].blank?
    @description = performance_params[:description] unless performance_params[:description].blank?
    @location = Location.find_by_name(performance_params[:location].split(" / ").first) unless performance_params[:location].blank?
    @price_per_hour = performance_params[:price_per_hour] unless performance_params[:price_per_hour].blank?
    @photo = performance_params[:photo] unless performance_params[:photo].blank?
    authorize @performance = Performance.find(params[:id])
    @performance.update(description: @description) unless @description.nil?
    @performance.update(price_per_hour: @price_per_hour) unless @price_per_hour.nil?
    @performance.update(character: @character) unless @character.nil?
    @performance.update(character_category: @character_category) unless @character_category.nil?
    @performance.update(performance_category: @performance_category) unless @performance_category.nil?
    @performance.update(location: @location) unless @location.nil?
    unless @photo.nil?
      @performance.photos.purge
      @performance.photos.attach(@photo)
    end
    redirect_to performances_path
  end

  def destroy
    authorize @performance = Performance.find(params[:id])
    @performance.destroy
    redirect_to performances_path
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
    params.require(:performance).permit(:character_id, :character_category, :performance_category_id, :location, :description, :price_per_hour, :photo)
  end
end
