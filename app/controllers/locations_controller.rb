class LocationsController < ApplicationController
  # before_action :set_user
  skip_before_action :authenticate_user!, only: %i[index show]

  def new
    @location = Location.new
    authorize @location
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    authorize @location
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
    @mlocations = Location.where.not(latitude: nil, longitude: nil)

    @markers = @mlocations.map do |mlocation|
      {
        lng: mlocation.longitude,
        lat: mlocation.latitude,
        infoWindow: { content: render_to_string(partial: "/locations/map_window", locals: { location: mlocation })}
      }
    end
  end

  def show
    @location = Location.find(params[:id])
    @booking = Booking.new
    authorize @booking
    @markers = [{
        lng: @location.longitude,
        lat: @location.latitude,
        infoWindow: { content: render_to_string(partial: "/locations/map_window", locals: { location: @location })}
      }]
  end

  private

  # def set_location
  #   @location = Location.find(params[:id])
  # end

  def location_params
    params.require(:location).permit(:name, :description, :price, :coordinates, :user_id, :photo, :address)
  end
end
