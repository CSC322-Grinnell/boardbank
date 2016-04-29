class OrganizationsController < Devise::RegistrationsController

  def index
    @organizations = Organization.all
  end

  #shows organization's profile page
  def show
    @org = Organization.find(params[:id])
  end

  #creates a new organization - saves to the database
  def create
    @organization = Organization.new(params[:organization])

    respond_to do |format|
      if @organization.save
        format.html { redirect_to :root, notice: 'Organizaiton was successfully created.' }
        format.json { render json: @organization, status: :created, location: @organization }
      else
        format.html { render action: 'new' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
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
      byebug
      redirect_to org_path(@organization.id)
      flash[:notice] = "Your account has been updated successfully."
    else
      redirect_to @organization
    end
  end

  def list
    @orgs = Organization.search params[:q] if params[:q].present?
    @orgs = Organization.all if !(params[:q]).present?
    #@orgs ||= Organization.search "Happy"
    @categories = ['']
    @all_categories = ['Arts/Musuem', 'Early Childhood', 'Literacy', 'Animal Rights', 'Environmental', 'Mental Health', 'Children/Youth', 'Health Care', 'Recreation', 'Civic/Community', 'Historical', 'Preservation', 'Senior Services', 'Disabilities', 'Homeless/Emergency', 'Substance Abuse', 'Education', 'Housing Development']
  end

end
