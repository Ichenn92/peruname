class BookingsController < ApplicationController
skip_after_action :verify_policy_scoped, :only => :index
before_action :authenticate_user!

  def index
    @bookings  = current_user.bookings.includes(:performance)
  end

    # GET "restaurants/:restaurant_id/reviews/new" view cours 1.22
  def new
    @performance = Performance.find(params[:performance_id])
    @user = User.find(params[:user_id])
    @booking = @performance.bookings.new
  end

  # POST "restaurants/:restaurant_id/reviews" view cours 1.33
  def create
    # dire quand on cree la review c'est ce resto
    @performance = Performance.find(params[:booking][:performance_id])
    @booking = @performance.bookings.new(booking_params)
    @booking.user = current_user
    # rediriger a la show restaurant
    if @booking.save
      flash[:success] = "This slot has been registered for you!"
      redirect_to "/bookings_path" #, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :start_time, :end_time, :performance_id, :user_id)
  end
end
