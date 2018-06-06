class PickPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.admin == true
  end

  def show?
    record.user == user || user.admin == true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def my_picks?
    record == user || user.admin == true
  end


end
