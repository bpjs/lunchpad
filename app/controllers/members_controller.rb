class MembersController < ApplicationController
  before_action :get_member, only: [:show, :edit, :destroy, :join_group, :leave_group]

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