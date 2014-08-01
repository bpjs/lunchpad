class GroupsController < ApplicationController
  before_action :get_community

  def index
    @groups = @community.groups
  end

  def create

  end

  def destroy
    @group = Group.find(params[:id])
  end

  private

    def get_community
      @community = Community.find(params[:community_id])
    end

end