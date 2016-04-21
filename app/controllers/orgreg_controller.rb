# app/controllers/registrations_controller.rb
class OrgregController < Devise::RegistrationsController
  def new
    super
  end

  def edit
    #@interests = Interest.all
    #@skills = Skill.all
    #@user_skills = Hash[resource.user_skills.map { |user_skill| [user_skill.skill_id, user_skill] }]
  end

  def create
    super
  end

  def update
    byebug
    org_params = params.require(:organization).permit(:orgname, :orgabout, :org_address, :org_city, :org_state, :org_zipcode, :org_telephone, :org_contactname, :email)
    if @organization.update_attributes(org_params)
      #handle successful update
      redirect_to :root
    else
      redirect_to @organization
    end
  end
end
