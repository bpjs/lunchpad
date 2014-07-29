class ReviewsController < ApplicationController
  before_action :get_review, only: [:edit, :update, :destroy]

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def get_review
      @review = review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:text, :rating, :restaurant_id)
    end

end