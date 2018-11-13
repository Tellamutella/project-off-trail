class UsersController < ApplicationController
  def dashboard
    @current = current_user
    authorize @current
  end
end
