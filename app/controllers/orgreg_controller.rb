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
    super
  end
end
