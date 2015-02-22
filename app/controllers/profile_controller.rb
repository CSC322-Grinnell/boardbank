class ProfileController < ApplicationController

def show
  @profile = current_user || current_organization || not_found
end

 def not_found
    raise ActionController::RoutingError.new('Profile Not Found')
  end

end
