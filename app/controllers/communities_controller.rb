class CommunitiesController < ApplicationController
  before_action :authenticate_member!, except: [:index]

  def index
    @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
    @restaurants = Restaurant.by_average_rating_for_community(@community.id).paginate(:per_page => 4, :page => params[:page])
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      flash[:notice] = "Community created succcessfully"
      redirect_to @community
    else
      render :new
    end
  end

  private

    def community_params
      params.require(:community).permit(:name, :latitude, :longitude)
    end

end