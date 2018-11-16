class ReviewsController < ApplicationController
  def create
    @location = Location.find(params[:location_id])
    @review = Review.new(review_params)
    @review.location = @location
    if @review.save
      redirect_to location_path(@location)
    else
      render 'location/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
