class CommunitiesController < ApplicationController
  before_action :authenticate_member!, except: [:index]
  before_action :get_community, only: [:show]
  before_action :authenticate_member_of_community, only: [:show]

  def index
    @communities = Community.all
  end

  def show
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

    def get_community
      @community = Community.find(params[:id])
    end

    def authenticate_member_of_community
      unless @community.members.include?(current_member)
        flash[:alert] = "You must be a member of this community to see it!"
        redirect_to communities_path
      end
    end

    def community_params
      params.require(:community).permit(:name, :address)
    end

end