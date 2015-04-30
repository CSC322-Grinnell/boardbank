class UserlistController < ApplicationController

  def show

    @interests = Interest.all

    if(params[:interests])
      interest_ids = params[:interests].map { |interest| interest.to_i }
# Search for users that have the interests checked on the form
      @users = User.joins(:user_interest).where('interest_id in (?)', interest_ids)
    else
      @users = User.all
    end

  end

  def index
  end
end
