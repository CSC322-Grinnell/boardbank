class FrontpageController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
    elsif organization_signed_in?
      @org = current_organization
    end
  end

  def approve_org
    org = Organization.find(params[:id])
    org.approved = true
    if org.save
      flash[:notice] = "#{org.name} approved"
    else
      # flash[:alert] = "#{org.orgname} approval failure"
    end
    redirect_to '/admin'
   end
end
