class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    record == user || user.admin == true
  end

  def update?
    record == user || user.admin == true
  end

  def update_card?
    record == user
  end
end
