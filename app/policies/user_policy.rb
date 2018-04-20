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
    record == user || user.admin == true
  end

  def update_address?
    record == user || user.admin == true
  end

  def update_paiement?
    record == user || user.admin == true
  end

  def update_civil?
    record == user || user.admin == true
  end

end
