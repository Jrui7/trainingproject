class ExchangePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def create?
      true
    end

    def update?
      record.user == user
    end

  end
end
