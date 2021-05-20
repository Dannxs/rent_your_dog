class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    @review = Review.new(review_params)
    @dog = Dog.find(params[:dog_id])
    @review.dog = @dog
    @dog.rating = Review.where("reviews.dog_id = ?", @dog.id).average("rating").to_i
    @review.save
    @dog.save
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
