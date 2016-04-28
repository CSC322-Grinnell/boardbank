# app/controllers/registrations_controller.rb
class OrgregController < Devise::RegistrationsController

  def update
    org_params = params.require(:organization).permit(:password, :password_confirmation, :orgname, :orgabout, :org_address, :org_city, :org_state, :org_zipcode, :org_telephone, :org_contactname, :email)
    #password cannot be blank, so what if the org doesn't want to update the password?
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
end
