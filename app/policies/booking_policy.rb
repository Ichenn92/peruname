class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def my_bookings?
    true
  end

  def my_performances?
    true
  end

  def show?
    true
  end

  def confirm?
    record.actor == user
  end

  def reject?
    record.actor == user
  end
end
