class AddShownumberToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :shownumber, :boolean
  end
end
