# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def edit
    @interests = Interest.all
    @skills = Skill.all
  end

  def create
    super
  end

  def update
    super do |user|
      user.interest_ids = params[:interests]
    end

  end
end
