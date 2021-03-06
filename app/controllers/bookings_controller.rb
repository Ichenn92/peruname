class BookingsController < ApplicationController
  skip_after_action :verify_policy_scoped, :only => :index
  before_action :authenticate_user!

  def my_bookings
    authorize @pending_bookings = Booking.my_upcoming_pending_events(current_user)
    authorize @canceled_bookings = Booking.my_upcoming_canceled_events(current_user)
    authorize @confirmed_bookings = Booking.my_upcoming_confirmed_events(current_user)
  end

  def my_performances
    authorize @pending_performances = Booking.my_upcoming_pending_performances(current_user)
    authorize @canceled_performances = Booking.my_upcoming_canceled_performances(current_user)
    authorize @confirmed_performances = Booking.my_upcoming_confirmed_performances(current_user)
  end

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
      redirect_to bookings_my_bookings_path
    else
      flash[:alert] = @booking.errors.full_messages
      redirect_back fallback_location: performance_path(@performance)
    end
  end

  def confirm
    authorize @booking = Booking.find(params[:booking_id])
    @booking.status = 2
    if @booking.valid?
      @booking.confirmed!
    else
      @booking.status = 1
      @booking.save(validate: false)
      flash[:warning] = "Booking got canceled cause you are no more available at that time"
    end

    redirect_to bookings_my_performances_path
  end

  def reject
    authorize @booking = Booking.find(params[:booking_id])
    @booking.canceled!
    redirect_to bookings_my_performances_path
  end
end
