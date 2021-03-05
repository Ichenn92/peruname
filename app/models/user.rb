class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  serialize :availability_start_time, Tod::TimeOfDay
  serialize :availability_end_time, Tod::TimeOfDay

  has_many :shows, class_name: "Booking", foreign_key: "actor_id"
  has_many :events, class_name: "Booking", foreign_key: "client_id"
  has_one_attached :photo
  has_many :performances
  validates_associated :performances

  validates_presence_of :nickname, :first_name, :last_name
  validates_inclusion_of :actor, in: [true, false]

  validate :start_time_cannot_be_greater_or_equal_end_time, if: :actor?

  with_options if: :actor? do
    validates :availability_start_time, presence: true
    validates :availability_end_time, presence: true
  end

  def start_time_cannot_be_greater_or_equal_end_time
    if availability_start_time > availability_end_time || availability_start_time == availability_end_time
      errors.add(:availability_start_time, "Must be earlier than availability end time")
      errors.add(:availability_end_time, "Must be later than availability start time")
    end
  end
end
