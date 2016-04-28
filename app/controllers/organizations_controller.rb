class OrganizationsController < ApplicationController
  #this controller currently does nothing
  def index
  end

  def show
    @org = Organization.find(params[:id])
    unless @org == current_organization
      redirect_to '/'
    end
  end

  def new
  end

  def edit
    super
  end

  def create
  end

  def update
    @organization = Organization.find(params[:id])
  end

  def destroy
  end

end
