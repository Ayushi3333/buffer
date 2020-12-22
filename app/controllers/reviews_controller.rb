class ReviewsController < ApplicationController
  def create
    @buddy = Buddy.find(params[:buddy_id])
    @review = Review.new(review_params)
    @review.buddy = @buddy
    @review.user = current_user
    if @review.save
      redirect_to buddy_path(@buddy)
    else
      render 'buddies/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
