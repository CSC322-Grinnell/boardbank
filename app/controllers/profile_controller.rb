class ProfileController < ApplicationController

def show
  @profile = current_user
end

 def not_found
    raise ActionController::RoutingError.new('User Not Found')
  end

end
