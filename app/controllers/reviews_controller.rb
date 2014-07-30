class ReviewsController < ApplicationController
  before_action :get_review, only: [:edit, :update, :destroy]

  def create
    @review = Review.create(review_params)
    @review.member = current_member
    if @review.save
      redirect_to(restaurant_path(@review.restaurant))
    else
      # TODO - make json!
      flash[:alert] = "You messed up!!"
      redirect_to(root_path)
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def get_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:text, :rating, :restaurant_id)
    end

end