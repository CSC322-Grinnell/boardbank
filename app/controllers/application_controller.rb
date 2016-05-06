class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do |e|
    if current_user
      redirect_to current_user
    else
      redirect_to '/' # placeholder before i can figure out the org thing
    end
  end
end
