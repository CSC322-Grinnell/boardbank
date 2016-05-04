class ChangeIntegerLimitInUsersTable < ActiveRecord::Migration
  def change
    change_column :users, :phonenumber, :integer, limit: 8
  end
end
