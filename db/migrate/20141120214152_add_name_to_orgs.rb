class AddNameToOrgs < ActiveRecord::Migration
  def change
    add_column :organizations, :orgname, :string
    add_column :organizations, :orgabout, :string
  end
end
