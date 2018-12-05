class PasswordResetsController < ApplicationController
  def new
  end

  def create
    email = params[:password_reset][:email].downcase
    @user = User.find_by(email: email)
    @org  = Organization.find_by(email: email)
    if @user
      process_request(@user)
    elsif  @org
      process_request(@org)
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end
  
  def edit
  end

  private

  def process_request(user)
    user.create_reset_digest
    user.send_password_reset_email
    flash[:info] = "Email sent with password reset instructions"
    redirect_to root_url
  end
  
  
end
