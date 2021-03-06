class BookingsController < ApplicationController
  skip_after_action :verify_policy_scoped, :only => :index
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings.includes(:performance)
  end

  # GET "restaurants/:restaurant_id/reviews/new" view cours 1.22
  def new
    @performance = Performance.find(params[:performance_id])
    @user = User.find(params[:user_id])
    @booking = @performance.bookings.new
  end

  # POST "restaurants/:restaurant_id/reviews" view cours 1.33
  def create
    @performance = Performance.find(params[:booking][:performance_id].to_i)
    authorize @booking = Booking.new()
    @booking.client = current_user
    @booking.performance = @performance
    @booking.actor = @performance.user
    @booking.date = params[:booking][:date]
    @booking.start_time = params[:booking]["start_time(4i)"].to_i
    @booking.end_time = params[:booking]["end_time(4i)"].to_i

    if @booking.save
      flash[:success] = "This slot has been registered for you!"
      redirect_to "/" #, notice: 'Review was successfully created.'
    else
      flash[:alert] = @booking.errors.full_messages
      redirect_back fallback_location: performance_path(@performance)
    end
  end
end
