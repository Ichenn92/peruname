class PerformancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def search?
    true
  end

  def new?
    user.actor
  end
end
