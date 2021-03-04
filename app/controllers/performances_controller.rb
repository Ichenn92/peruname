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
      @character_category = CharacterCategory.find_or_create_by(name: params[:character_category][:name])
      # @character = Character.find_or_create_by(name: character_params[:name]) do |character|
      #   character.character_category = @character_category
      # end
      @performance_category = PerformanceCategory.find_or_create_by(name: performance_params[:performance_category])
      @location = Location.find_or_create_by(address: performance_params[:location])
      authorize @performance = Performance.new({ description: performance_params[:description],
                                                     price_per_hour: performance_params[:price_per_hour],
                                                     character: @character,
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
    params.require(:performance).permit(:description, :price_per_hour, :performance_category, 
      character_category_attributes: [:name])
  end
end
