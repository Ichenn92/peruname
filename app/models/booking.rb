class Booking < ApplicationRecord
  serialize :start_time, Tod::TimeOfDay
  serialize :end_time, Tod::TimeOfDay
  before_create :init_price

  belongs_to :performance
  belongs_to :client, :class_name => "User"
  belongs_to :actor, :class_name => "User"

  enum status: [:pending, :canceled, :confirmed]

  validates_presence_of :date, :start_time, :end_time

  default_scope { order(date: :asc) }
  scope :my_upcoming_pending_events, -> (user) { where("client_id = ? AND date >= ? AND status = ? ", user.id, Date.today, 0) }
  scope :my_upcoming_canceled_events, -> (user) { where("client_id = ? AND date >= ? AND status = ? ", user.id, Date.today, 1) }
  scope :my_upcoming_confirmed_events, -> (user) { where("client_id = ? AND date >= ? AND status = ? ", user.id, Date.today, 2) }

  scope :my_upcoming_pending_performances, -> (user) { where("actor_id = ? AND date >= ? AND status = ? ", user.id, Date.today, 0) }
  scope :my_upcoming_canceled_performances, -> (user) { where("actor_id = ? AND date >= ? AND status = ? ", user.id, Date.today, 1) }
  scope :my_upcoming_confirmed_performances, -> (user) { where("actor_id = ? AND date >= ? AND status = ? ", user.id, Date.today, 2) }

  private

  def init_price
    duration = self.end_time - self.start_time
    hour_price = self.performance.price_per_hour
    self.price = duration.hour * hour_price
  end
end
