class AddShownumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shownumber, :boolean
  end
end
