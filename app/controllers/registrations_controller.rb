# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

  def edit
    @interests = Interest.all
    @skills = Skill.all
    @user_skills = Hash[resource.user_skills.map { |user_skill| [user_skill.skill_id, user_skill] }]
  end


  def update
    user_params = params.require(:user).permit(:firstname, :lastname, :address,
 :city, :state, :zipcode, :phonenumber, :education, :areaofstudy, :email, :availability,
 :additional_comments, :password, :password_confirmation, :financial_contribution, :fundraise, :previous_experience)
    #passwords not allowed to be updated as blank
    if user_params[:password].empty? and user_params[:password_confirmation].empty?
      user_params.extract!(:password, :password_confirmation)
    end

    if user_params[:state].empty?
      user_params.extract!(:state)
    end
    if user_params[:education].empty?
      user_params.extract!(:education)
    end
    if @user.update(user_params)
      sign_in(@user, :bypass => true)
      #only update skills if user update went through => password supplied was correct
      skill_params = params.require(:user)[:user_skills_attributes]
      if skill_params
        skill_params.each do |num, skill|
          if skill.has_key?("experience_level")
              skill_to_update = @user.user_skills.find_or_create_by(skill_id: skill[:skill_id])
              skill_to_update.update!(experience_level:skill[:experience_level])
          end
        end
      end
      redirect_to user_path
      flash[:notice] = "Your account has been updated successfully."
    else
      redirect_to :root
    end
  end
end
