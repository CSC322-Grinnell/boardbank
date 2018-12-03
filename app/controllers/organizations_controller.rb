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
    @organization = Organization.new(org_params)
    if @organization.save
      redirect_to :root, notice: 'You have signed up successfully but your account has not been approved.'
    else
      render action: 'new'
    end
  end

  #updates the edits from the edit profile page
  def update
    updated_info = org_params
    #password cannot be blank, so what if the org doesn't want to update the password?
    #we make sure nothing gets updated in the password field then.
    require_password = true
    if updated_info[:password].empty? and updated_info[:password_confirmation].empty? and updated_info[:current_password].empty?
      updated_info.extract!(:password, :password_confirmation, :current_password)
      require_password = false
    end

    # Prevent the state field from getting cleared everytime a user goes to the edit page
    if updated_info[:state].empty?
      updated_info.extract!(:state)
    end

    #otherwise update the attributes
    if (require_password and @organization.update_with_password(updated_info)) or ((not require_password) and @organization.update_without_password(updated_info))      #handle successful update
      sign_in(@organization, :bypass => true)
      redirect_to org_path()
      flash[:notice] = "Your account has been updated successfully."
    else
      render action: 'edit'
      #redirect_to edit_organization_registration_path
      #flash[:alert] = @organization.errors.full_messages.join(" and ").html_safe
    end
  end

  def index

    @orgs = Organization.search params[:search] if params[:search].present?
    @orgs = Organization.all if !(params[:search]).present?
    @orgs = @orgs.to_a.delete_if {|x| x.approved == false}
    @categories = ['']
    @all_categories = ['Arts/Musuem', 'Early Childhood', 'Literacy', 'Animal Rights', 'Environmental', 'Mental Health', 'Children/Youth', 'Health Care', 'Recreation', 'Civic/Community', 'Historical', 'Preservation', 'Senior Services', 'Disabilities', 'Homeless/Emergency', 'Substance Abuse', 'Education', 'Housing Development']
    
    @orgs = Kaminari.paginate_array(@orgs)
    if params[:page].present?
      @orgs = @orgs.page(params[:page])
    else
      @orgs = @orgs.page(1)
    end
  end

  private

  def org_params
    params.require(:organization)
          .permit(:password, :password_confirmation,
                  :current_password, :name, :about, :address, :city, :state,
                  :zipcode, :telephone, :contact_name, :email, :remember_me)
  end
end
