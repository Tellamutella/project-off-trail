class LocationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # Location.where(user is current user)
    end
  end

  def create?
    # only a scout can create a location
    @user && @user.is_scout
  end

  def new?
    create?
  end

  def update?
    @user && @user.is_scout && @record.user == @user
  end

  def edit?
    update?
  end

  def destroy?
    @user && @user.is_scout && @record.user == @user
  end

  def show?
    true
  end
end
