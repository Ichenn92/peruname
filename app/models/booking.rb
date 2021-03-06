class Booking < ApplicationRecord
  serialize :start_time, Tod::TimeOfDay
  serialize :end_time, Tod::TimeOfDay
  before_create :init_price

  belongs_to :performance
  belongs_to :client, :class_name => "User"
  belongs_to :actor, :class_name => "User"

  enum status: [:pending, :canceled, :confirmed]

  validates_presence_of :date, :start_time, :end_time
  validate :booking_date_cannot_be_in_past
  validate :actor_is_free

  scope :my_upcoming_events, -> { where("client_id = ? AND date >= ?", current_user.id, Date.today) }
  scope :my_upcoming_performances, -> { where("actor_id = ? AND date >= ?", current_user.id, Date.today) }

  private

  def booking_date_cannot_be_in_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

  def actor_is_free
    actor_events = Booking.where("actor_id = ? AND date = ? AND status = ?", actor.id, date, 2)
    asked_shift_time = Tod::Shift.new(Tod::TimeOfDay(start_time), Tod::TimeOfDay(end_time), true)
    actor_is_available = actor_events.none? do |event|
      event_shift_time = Tod::Shift.new(Tod::TimeOfDay(event.start_time), Tod::TimeOfDay(event.end_time), true)
      event_shift_time.overlaps?(asked_shift_time)
    end

    errors.add(:date, "This actor is not free at that time") unless actor_is_available
  end

  def init_price
    duration = self.end_time - self.start_time
    hour_price = self.performance.price_per_hour
    self.price = duration.hour * hour_price
  end
end
