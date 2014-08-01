class GroupsController < ApplicationController
  before_action :get_community, :authenticate_member!

  def index
    @groups = @community.groups
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      current_member.group = @group
      current_member.save
      flash[:notice] = "Group successfully created."
    else
      flash[:alert] = "Error creating group."
    end
    redirect_to community_groups_path(@community)
  end

  def destroy
    @group = Group.find(params[:id])
  end

  private

    def get_community
      @community = Community.find(params[:community_id])
    end

    def group_params
      params.require(:group).permit(:restaurant_id, :community_id)
    end

end