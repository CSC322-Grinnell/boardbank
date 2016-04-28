class OrganizationsController < Devise::RegistrationsController

  def index
    @organizations = Organization.all
  end

  #shows organization's profile page
  def show
    @org = Organization.find(params[:id])
  end

  #creates a new organization - sign up page
  def new
    super
  end

  #edit profile page
  def edit
    super
  end

  #creates a new organization - saves to the database
  def create
    byebug
    super
  end

  #updates the edits from the edit profile page
  def update
    org_params = params.require(:organization).permit(:password, :password_confirmation, :orgname, :orgabout, :org_address, :org_city, :org_state, :org_zipcode, :org_telephone, :org_contactname, :email)
    #password cannot be blank, so what if the org doesn't want to update the password?
    #we make sure nothing gets updated in the password field then.
    if org_params[:password].empty? and org_params[:password_confirmation].empty?
      org_params.extract!(:password, :password_confirmation)
    end

    # Prevent the state field from getting cleared everytime a user goes to the edit page
    if org_params[:org_state].empty?
      org_params.extract!(:org_state)
    end

    #otherwise update the attributes
    if @organization.update_attributes(org_params)
      #handle successful update
      redirect_to :root
    else
      redirect_to @organization
    end
  end

  #deletes organization's profile
  def destroy
    byebug
    super
  end

end
