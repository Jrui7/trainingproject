class ExchangePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def show?
    record.user == user
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

end
