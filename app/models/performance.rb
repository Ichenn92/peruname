class Performance < ApplicationRecord
  reverse_geocoded_by "locations.latitude", "locations.longitude"

  belongs_to :user
  belongs_to :character
  belongs_to :location

  has_one :character_category, through: :character
  has_many_attached :photos
  belongs_to :performance_category

  has_many :bookings

  validates :user, presence: true
  validates :character, presence: true
  validates :character_category, presence: true
  validates :location, presence: true
  validates :price_per_hour, presence: true

  def self.search_near_performances_with_filter(params)
    performances = Performance.joins(:location).near(params[:address], 5)

    if params[:performance][:character_category].present?
      performances = performances.joins(:character_category).where(character_category: { id: params[:performance][:character_category] })
    end

    if params[:performance][:performance_category].present?
      performances = performances.where(performance_category: params[:performance][:performance_category])
    end

    if params[:performance]["availability_start_time(4i)"].present? && params[:performance]["availability_end_time(4i)"].present?
      start_time = Tod::TimeOfDay::new(params[:performance]["availability_start_time(4i)"].to_i)
      end_time = Tod::TimeOfDay::new(params[:performance]["availability_end_time(4i)"].to_i)

      if start_time < end_time
        shift = Tod::Shift.new(start_time, end_time)
        performances = performances.select do |performance|
          actor = performance.user
          actor_shift = Tod::Shift.new(actor.availability_start_time, actor.availability_end_time)
          actor_shift.contains? shift
        end
      end

      if params[:date].present?
        shift
        performances = performances.select do |performance|
          performance.bookings.none? do |booking|
            if booking.date == params[:date]
              booking_shift = Tod::Shift.new(booking.start_time, booking.end_time)
              shift.overlaps?(booking_shift)
            end
          end
        end
      end
    end

    performances
  end

  # TODO: add validation of user where actor is true
  # TODO: add validation that price_per_hour is an integer > 10

end
