ActiveAdmin.register User do
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :firstname
    column :lastname
    actions
  end

  filter :email

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
end