ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :firstname, :lastname
  config.comments = false
  index do
    column :firstname
    column :lastname
    column :email
    column :education
    column :previous_experience
    column :fundraise
    column :financial_contribution
    column :availability

    actions
  end

  filter :firstname
  filter :lastname
  filter :availability

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :firstname
      f.input :lastname
    end
    f.actions
  end
  
  member_action :reset_password do
    flash[:error] = "Please contact the administrator to change your password."
  end
  
  show :title =>  proc {|user|user.firstname + " " + user.lastname } do
    #page_title user.firstname + " " + user.lastname
    attributes_table :email, :firstname, :lastname, :education, :areaofstudy, :previous_experience, :fundraise, :financial_contribution, :availability, :address, :city, :state, :zipcode, :phonenumber, :additional_comments
  end
  
end
