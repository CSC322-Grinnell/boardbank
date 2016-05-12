class OrganizationsController < Devise::RegistrationsController

  #shows organization's profile page
  def show
    if params[:id].present?
      @org = Organization.find(params[:id])
    else 
      @org = current_organization
    end

  end

  #creates a new organization - saves to the database
  def create
    @organization = Organization.new(params[:organization])
    if @organization.save
      redirect_to :root, notice: 'You have signed up successfully but your account has not been approved.'
    else
      render action: 'new'
    end
  end

  #updates the edits from the edit profile page
  def update
    org_params = params.require(:organization).permit(:password, :password_confirmation, :current_password, :name, :about, :address, :city, :state, :zipcode, :telephone, :contact_name, :email)
    #password cannot be blank, so what if the org doesn't want to update the password?
    #we make sure nothing gets updated in the password field then.
    require_password = true
    if org_params[:password].empty? and org_params[:password_confirmation].empty? and org_params[:current_password].empty?
      org_params.extract!(:password, :password_confirmation, :current_password)
      require_password = false
    end

    # Prevent the state field from getting cleared everytime a user goes to the edit page
    if org_params[:state].empty?
      org_params.extract!(:state)
    end

    #otherwise update the attributes
    if (require_password and @organization.update_with_password(org_params)) or ((not require_password) and @organization.update_without_password(org_params))      #handle successful update
      sign_in(@organization, :bypass => true)
      redirect_to org_path()
      flash[:notice] = "Your account has been updated successfully."
    else
      redirect_to org_path()
      flash[:notice] = "Update unsuccessful."
    end
  end

  def index

    @orgs = Organization.search params[:search] if params[:search].present?
    @orgs = Organization.all if !(params[:search]).present?
    @categories = ['']
    @all_categories = ['Arts/Musuem', 'Early Childhood', 'Literacy', 'Animal Rights', 'Environmental', 'Mental Health', 'Children/Youth', 'Health Care', 'Recreation', 'Civic/Community', 'Historical', 'Preservation', 'Senior Services', 'Disabilities', 'Homeless/Emergency', 'Substance Abuse', 'Education', 'Housing Development']
  end

end
