class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  serialize :availibility_start_time, Tod::TimeOfDay
  serialize :availibility_end_time, Tod::TimeOfDay

  attr_accessor :first_name, :last_name

  validates_presence_of :nickname, :first_name, :last_name
  validates_inclusion_of :actor, in: [true, false]

  validate :start_time_cannot_be_greater_or_equal_end_time, if: :actor?

  with_options if: :actor? do
    validates :availibility_start_time, presence: true
    validates :availibility_end_time, presence: true
  end

  def start_time_cannot_be_greater_or_equal_end_time
    if availibility_start_time > availibility_end_time || availibility_start_time == availibility_end_time
      errors.add(:availibility_start_time, "Must be earlier than availibility end time")
      errors.add(:availibility_end_time, "Must be later than availibility start time")
    end
  end
end
