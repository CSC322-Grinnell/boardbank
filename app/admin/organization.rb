ActiveAdmin.register Organization do
  
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    actions
  end

  filter :email

  form do |f|
    
    f.inputs 'Admin Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
    
  end
  
  # Hides encrypted password:
  show do
    attributes_table do
      default_attribute_table_rows.each do |field|
        if (field!=:encrypted_password) then
          row field
        end
      end
    end
  end
  
  # Adds "Approve" button, if organization isn't approved yet
  # !!! Needs testing !!!
  # Useful pages:
  # https://www.google.com/search?q=edit+active+admin+show+actions
  # https://github.com/activeadmin/activeadmin/issues/341
  # http://activeadmin.info/docs/8-custom-actions.html
  action_item :approve, only: :show do #only in the show page!
    if !Organization.find(params[:id]).approved? then
      link_to "Approve", approve_org_path(params[:id])
    end
  end
  
  action_item :view_as_user, only: :show do
    link_to "View As User", org_path(params[:id])
  end
end
