ActiveAdmin.register User do
  
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
  
  show do
    attributes_table :email, :firstname, :lastname, :education, :areaofstudy, :previous_experience, :fundraise, :financial_contribution, :availability, :address, :city, :state, :zipcode, :phonenumber, :additional_comments
  end
  
end


def hide_fields (fields)
  fields.each do |f|
    
  end
end
