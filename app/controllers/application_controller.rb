class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do |e|
    if current_user
      puts "DADADADUM"
      redirect_to current_user
    else
      puts "OISAJKDIAULSDJ"
      redirect_to '/' # placeholder before i can figure out the org thing
    end
  end
end
