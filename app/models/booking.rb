class Booking < ApplicationRecord
  serialize :start_time, Tod::TimeOfDay
  serialize :end_time, Tod::TimeOfDay
  before_create :init_price

  belongs_to :performance
  belongs_to :client, :class_name => "User"
  belongs_to :actor, :class_name => "User"

  enum status: [:pending, :canceled, :confirmed]

  validates_presence_of :date, :start_time, :end_time

  scope :my_upcoming_events, -> { where("client_id = ? AND date >= ?", current_user.id, Date.today) }
  scope :my_upcoming_performances, -> { where("actor_id = ? AND date >= ?", current_user.id, Date.today) }

  private

  def init_price
    duration = self.end_time - self.start_time
    hour_price = self.performance.price_per_hour
    self.price = duration.hour * hour_price
  end
end
