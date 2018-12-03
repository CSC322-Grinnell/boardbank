class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  rescue_from ActiveRecord::RecordNotFound do |e|
    if current_user
      # TO BE EDITED, DANGEROUS, MIGHT REDIRECT INDEFINITELY
      # puts e
      redirect_to current_user
    else
      redirect_to '/' # placeholder before i can figure out the org thing
    end
  end
end
