class ReviewsController < ApplicationController
  before_action :get_review, only: [:edit, :update, :destroy]

  before_action :authenticate_member!

  def create
    @review = Review.create(review_params)
    @review.member = current_member
    render :create_errors if !@review.save
  end

  def edit

  end

  def update
    @review.update(review_params)
    render :update_errors if !@review.save
  end

  def destroy
    @review.destroy
  end

  private

    def get_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:text, :rating, :restaurant_id)
    end

end