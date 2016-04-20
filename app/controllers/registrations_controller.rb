# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def edit
    @interests = Interest.all
    @skills = Skill.all
    @user_skills = Hash[resource.user_skills.map { |user_skill| [user_skill.skill_id, user_skill] }]
  end

  def create
    super
  end

  def update

    user_params = params.require(:user).permit(:firstname, :lastname, :address, 
 :city, :state, :zipcode, :phonenumber, :education, :areaofstudy, :email, :availability, :additional_comments, :password, 
 :password_confirmation)
    #passwords not allowed to be updated as blank
    if user_params[:password].empty? and user_params[:password_confirmation].empty?
      user_params.extract!(:password, :password_confirmation)
    end
    if @user.update_attributes!(user_params)
      sign_in(@user, :bypass => true)
      redirect_to @user
    else
      redirect_to :root
    end
  end
end
