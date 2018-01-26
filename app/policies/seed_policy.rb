class SeedPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    user.admin == true
  end

  def admin?
    user.admin == true
  end

end
