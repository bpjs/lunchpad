class MembersController < ApplicationController
  before_action :get_member, except: [:new, :create, :update]

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

  def join_community
    @new_community = Community.find(params[:community_id])
    @member.member_communities.build(community: @new_community)
    @member.save
    flash[:notice] = "Welcome to #{@new_community.name}!"
    redirect_to @new_community
  end

  def leave_community
    @community = Community.find_by(params[:community_id])
    @member.member_communities.find_by(params[:community_id]).delete
    @member.save
    flash[:notice] = "Successfully left #{@community.name}"
    redirect_to root_path
  end

  def join_group
    @old_group = @member.group
    @new_group = Group.find(params[:group_id])
    @member.group = @new_group
    @member.save
  end

  def leave_group
    @old_group = @member.group
    @member.group = nil
    @member.save
  end

  private

    def get_member
      @member = Member.find(params[:id])
    end

    def member_params
      # TODO - fix please
      params.require(:member).permit(:name, :email, :community_id)
    end

end