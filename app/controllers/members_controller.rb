class MembersController < ApplicationController
  before_action :get_member, only: [:show, :edit, :destroy]

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

  private

    def get_member
      @member = Member.find(params[:id])
    end

    def member_params
      # TODO - fix please
      params.require(:member).permit(:name, :email, :community_id)
    end

end