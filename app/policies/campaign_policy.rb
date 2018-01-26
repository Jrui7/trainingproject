class CampaignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def pending?
    user.admin == true
  end

  def update?
    user.admin == true
  end

  def success?
    user.admin == true
  end

  def fail?
    user.admin == true
  end

  def signaled?
    user.admin == true
  end


end
