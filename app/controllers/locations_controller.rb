class LocationsController < ApplicationController
  # before_action :set_user
  skip_before_action :authenticate_user!, only: %i[index show]

  def new
    @location = Location.new
    authorize @location
  end

  def create
    @location = authorize Location.new(location_params)
    @location.user = policy(Location).user
    if @location.save
      redirect_to @location
    else
      render :new
    end
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
    @location = authorize Location.find(params[:id])
  end

  private

  # def set_location
  #   @location = Location.find(params[:id])
  # end

  def location_params
    params.require(:location).permit(:name, :description, :price, :coordinates, :user_id)
  end
end
