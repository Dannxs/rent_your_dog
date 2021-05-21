class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.dog = @booking.dog
    @review.user = @booking.user
    @review.save
    @dog = @booking.dog
    if @dog.reviews.count == 1
      @dog.rating = @dog.reviews.first.rating
    else
      ratings = Review.where("reviews.dog_id = ?", @dog.id).map { |review| review.rating }
      @dog.rating = ratings.sum.fdiv(ratings.count).round
    end
    @dog.save
    redirect_to dashboard_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
