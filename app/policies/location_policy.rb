class LocationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: @user) # Location.where(user is current user)
    end
  end

  def new?
    # only a scout can create a location
    @user.is_scout
  end

  def create?
    new?
  end

  def edit
    @user.is_scout && @record.user == @user
  end

  def update?
    edit?
  end

  def destroy
    @user.is_scout && @record.user == @user
  end
end
