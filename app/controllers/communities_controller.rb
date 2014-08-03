class CommunitiesController < ApplicationController

  def show
    @community = Community.find(params[:id])
    @restaurants = Restaurant.by_average_rating_for_community(@community.id).paginate(:per_page => 4, :page => params[:page])
  end

end