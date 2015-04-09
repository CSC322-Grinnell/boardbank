class UserlistController < ApplicationController

  def show
    @users = User.all
    @all_interests = ["Arts/Museum", "Early Childhood", "Literacy",
                      "Animal Rights", "Environmental",
                      "Mental Health", "Children/Youth",
                      "Health Care", "Recreation",
                      "Civic/Community", "Historical",
                      "Preservation", "Senior Services",
                      "Disabilities", "Homeless/Emergency",
                      "Substance Abuse", "Education",
                      "Housing Development"]


  end

  def index
  end
end
