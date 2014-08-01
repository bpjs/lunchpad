class RestaurantsController < ApplicationController
  before_action :get_restaurant, only: [:show, :destroy]

  before_action :authenticate_member!

  def show
    @community = @restaurant.community
  end

  def create
    @restaurant = Restaurant.existing_restaurant(params[:restaurant][:yelp_url]) || Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      flash.now[:alert] = "Restaurant was not saved properly."
      render 'communities/show'
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to root_path, alert: "Restaurant deleted"
  end

  def yelp_call
    coordinates = { latitude: params[:latitude], longitude: params[:longitude] }
    results = Yelp.client.search_by_coordinates(coordinates, { term: params[:name], limit: 5})
    render json: JSON.parse(results.to_json)["businesses"]
  end

  private

    def get_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :category, :yelp_url, :address, :latitude, :longitude, :community_id)
    end

end