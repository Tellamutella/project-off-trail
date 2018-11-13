class LocationsController < ApplicationController
  def new
    @location = Location.new
    authorize @location
  end

  def create
    @location = Location.new(location_params)
    authorize @location
    # if @location.save ...
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @locations = policy_scope(Location).order(created_at: :desc)
  end

  def show
  end

  private

  def location_params
    params.require(:location).permit(:name, :description, :price, :coordinates, :user_id)
  end
end
