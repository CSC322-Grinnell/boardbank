class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]    # Case (1)


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
      flash.now[:alert] = "Email address not found"
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if params[:user][:password].empty?                  # Case (3)
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)          # Case (4)
      @user.update_attribute(:reset_digest, nil)
      flash[:notice] = "Password has been reset."
      redirect_to root_url
    else
      render 'edit'                                     # Case (2)
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def process_request(user)
    user.create_reset_digest
    user.send_password_reset_email
    flash[:notice] = "Email sent with password reset instructions"
    redirect_to root_url
  end

  def get_user
    email = params[:email]
    user = User.find_by(email: email)
    if user
      @user = user
    else
      @user = Organization.find_by(email: email)
    end
  end

  # Checks expiration of reset token.
  def check_expiration
    if @user.password_reset_expired?
      flash[:alert] = "Password reset token has expired."
      redirect_to new_password_reset_url
    end
  end
end
