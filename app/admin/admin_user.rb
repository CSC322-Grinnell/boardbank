ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
  index do
    column :email
    actions
  end

  filter :email
  
  show do
    attributes_table :email
  end
  
  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
