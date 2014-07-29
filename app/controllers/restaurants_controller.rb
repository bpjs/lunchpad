class RestaurantsController < ApplicationController
  before_action :get_restaurant, only: [:show, :edit, :update, :destroy]

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def get_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :category, :yelp_url, :address)
    end

end