class RestaurantsController < ApplicationController
  before_action :get_restaurant, only: [:show, :edit, :update, :destroy]

  def show
    @community = @restaurant.community
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      flash[:alert] = "Restaurant was not saved properly."
      render 'communities/show'
    end
  end

  def edit
  end

  def update

  end

  def destroy

  end

  def yelp_call
    coordinates = { latitude: params[:latitude], longitude: params[:longitude] }
    results = Yelp.client.search_by_coordinates(coordinates, { term: params[:name], limit: 5})
    binding.pry
    render json: JSON.parse(results.to_json)["businesses"]
  end

  private

    def get_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :category, :yelp_url, :address, :community_id)
    end

end