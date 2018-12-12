class AddResetToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :reset_digest, :string
    add_column :organizations, :reset_sent_at, :datetime
  end
end
