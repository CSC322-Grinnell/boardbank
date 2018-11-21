class OrgAuth < ActiveRecord::Migration[5.1]
  def self.up
    add_column :organizations, :approved, :boolean, default: false, null: false
    add_index :organizations, :approved
  end

  def self.down
    remove_index :organizations, :approved
    remove_column :organizations, :approved
  end
end
