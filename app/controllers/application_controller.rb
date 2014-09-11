class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :other_members_of_community

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up){|u| u.permit :name, :email, :password, :password_confirmation}
  end

  def other_members_of_community(community)
    community.members.where.not(id: current_member.id)
  end

end