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

end
