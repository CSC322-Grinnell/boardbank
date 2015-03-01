class OrglistController < ApplicationController

  def show
    @orgs = Organization.all
  end
end
