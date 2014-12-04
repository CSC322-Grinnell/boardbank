class AddDetailsToOrg < ActiveRecord::Migration
  def change
    add_column :organizations, :org_address, :string
    add_column :organizations, :org_city, :string
    add_column :organizations, :org_state, :string
    add_column :organizations, :org_zipcode, :string
    add_column :organizations, :org_telephone, :string
  end
end
