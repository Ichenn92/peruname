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
      @user = current_user
      authorize @performance = Performance.new(user: @user)
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
end
