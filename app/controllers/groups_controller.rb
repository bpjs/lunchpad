class GroupsController < ApplicationController
  before_action :get_community, :authenticate_member!, :authenticate_member_of_community

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
      flash[:alert] = "Error: Group must have a name and a time."
    end
    redirect_to community_groups_path(@community)
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
  end

  def destroy
    @group = Group.find(params[:id])
  end

  private

    def get_community
      @community = Community.find(params[:community_id])
    end

    def group_params
      params.require(:group).permit(:time, :info, :restaurant_id, :community_id)
    end

    def authenticate_member_of_community
      unless @community.members.include?(current_member)
        flash[:alert] = "You must be a member of this community to see its lunch groups!"
        redirect_to communities_path
      end
    end

end