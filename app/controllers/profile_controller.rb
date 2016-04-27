class ProfileController < ApplicationController

  def show_user
    @user = User.find(params[:id])
    @skills = Skill.all
    unless @user == current_user
      if current_user.nil?
        redirect_to :root
      else
        redirect_to current_user
      end
    end
  end

  def show_org
    @org = Organization.find(params[:id])
  end

  def not_found
    fail ActionController::RoutingError.new('Profile Not Found')
  end

  def edit
    @interests = Interests.all
  end
end
