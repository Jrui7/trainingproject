class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    record == user
  end

  def update?
    record == user
  end

  def update_card?
    record == user
  end
end
