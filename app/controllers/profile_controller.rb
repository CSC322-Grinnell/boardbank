class ProfileController < ApplicationController

  def not_found
    fail ActionController::RoutingError.new('Profile Not Found')
  end

end
