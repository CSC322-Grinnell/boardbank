class UsersController < ApplicationController

  def edit
    #@interests = Interest.all
    #@skills = Skill.all
    #@user_skills = Hash[resource.user_skills.map { |user_skill| [user_skill.skill_id, user_skill] }]
  end

  def update
    org_params = params.require(:organization).permit(:orgname, :orgabout, :org_address, :org_city, :org_state, :org_zipcode, :org_telephone, :org_contactname)
    if @organization.update_attributes(org_params)
      #handle successful update
      byebug
      redirect_to @organization
    else
      redirect_to @organization
    end
  end

  def show
    @org = Organization.find(params[:id])
    unless @org == current_organization
      redirect_to '/'
    end
  end
end
