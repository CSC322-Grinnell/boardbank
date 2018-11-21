class RenameOrgTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :organizations, :org_contactname, :contact_name
    rename_column :organizations, :org_address, :address
    rename_column :organizations, :org_telephone, :telephone
    rename_column :organizations, :org_city, :city
    rename_column :organizations, :org_state, :state
    rename_column :organizations, :org_zipcode, :zipcode
    rename_column :organizations, :orgname, :name
    rename_column :organizations, :orgabout, :about
  end
end
