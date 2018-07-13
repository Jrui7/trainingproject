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

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user || user.admin == true
  end

  def update_card?
    record.user == user || user.admin == true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  # def my_picks?
  #   true
  # end

  # def pick_history?
  #   true
  # end


end
