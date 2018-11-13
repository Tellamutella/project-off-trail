class BookingsController < ApplicationController
skip_before_action :authenticate_user!, only: %i[new create]
  def new
    @booking = Booking.new
    @location = Location.find(params[:location_id])
    authorize @booking
  end

  def create
    @booking = authorize Booking.new(booking_params)
    @location = Location.find(params[:location_id])
    @booking.location = @location
    @booking.user = current_user
    if @booking.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to locations_path
  end

  def booking_params
    params.require(:booking).permit(:date, :location_id)
  end
end
