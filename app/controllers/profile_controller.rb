class ProfileController < ApplicationController

  def show_user
    @user = current_user 
    @skills = Skill.all
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
