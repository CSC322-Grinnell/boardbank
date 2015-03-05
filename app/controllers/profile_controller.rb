class ProfileController < ApplicationController

def show_user
  @user = User.find(params[:id])
end

def show_org
  @org = Organization.find(params[:id])
end

 def not_found
    raise ActionController::RoutingError.new('Profile Not Found')
  end

end
