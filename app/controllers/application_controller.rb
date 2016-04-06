class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do |e|
    redirect_to current_user
    #render :json => {"ErrorType" => "Record Not Found", "message" => e.message}
  end
  #  protected

  #  def configure_devise_permitted_parameters
  #    registration_params = [:org_contactname, :org_address, :org_telephone, :org_city, :org_state, :org_zipcode, :orgname, :orgabout, :firstname, :lastname, :is_org, :email, :password, :password_confirmation]

  #    if params[:action] == 'update'
  #      devise_parameter_sanitizer.for(:account_update) {
  #        |u| u.permit(registration_params << :current_password)
  #    }
  #    elsif params[:action] == 'create'
  #      devise_parameter_sanitizer.for(:sign_up) {
  #        |u| u.permit(registration_params)
  #      }
  #    end
  #  end
end
