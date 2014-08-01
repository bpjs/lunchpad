class CommunitiesController < ApplicationController

  def show
    @community = Community.find(params[:id])
    @restaurants = Restaurant.by_average_rating_for_community(@community.id)
  end

end