class PerformancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

<<<<<<< HEAD
  def show?
=======
  def search?
>>>>>>> master
    true
  end
end
