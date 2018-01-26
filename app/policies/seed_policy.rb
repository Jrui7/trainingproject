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

  def last_day?
    true
  end

  def popular?
    true
  end

  def newest?
    true
  end

  def admin?
    user.admin == true
  end

end
