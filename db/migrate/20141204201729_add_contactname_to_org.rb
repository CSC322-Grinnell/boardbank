class AddContactnameToOrg < ActiveRecord::Migration
  def change
    add_column :organizations, :org_contactname, :string
  end
end
