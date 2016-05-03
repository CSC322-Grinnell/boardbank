class UsersController < Devise::RegistrationsController
  # GET /users
  # GET /users.json

  def index
    @users = User.all
    @interests = Interest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @interests = Interest.all
    @skills = Skill.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @interests = Interest.all
    @skills = Skill.all
    @user_skills = Hash[resource.user_skills.map { |user_skill| [user_skill.skill_id, user_skill] }]
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
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
      redirect_to @user #user_path
      flash[:notice] = "Your account has been updated successfully."
    else
      redirect_to :root
    end
  end

  def index
    @users = User.search params[:q] if params[:q].present?
    @users = User.all if !(params[:q]).present?
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
