class PerformancePolicy < ApplicationPolicy


  def index?
    true
  end

  def create?
    user
  end
end
