class UsersController < ApplicationController
  def dashboard
    @current = current_user
    @locations = policy_scope(Location).order(created_at: :desc)
    authorize @current
  end
end
