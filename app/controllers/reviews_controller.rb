class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    @review = Review.new(review_params)
    @dog = Dog.find(params[:dog_id])
    @review.dog = @dog
    @review.save
    if @dog.reviews.count == 1
      @dog.rating = @dog.reviews.first.rating
    else
      ratings = Review.where("reviews.dog_id = ?", @dog.id).map { |review| review.rating }
      @dog.rating = ratings.sum.fdiv(ratings.count).round
    end
    @dog.save
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
