class AddOtherFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :education, :string
    add_column :users, :areaofstudy, :string
    add_column :users, :previous_experience, :boolean, default: false
    add_column :users, :interest_1, :string
    add_column :users, :interest_2, :string
    add_column :users, :interest_3, :string
    add_column :users, :interest_4, :string
    add_column :users, :interest_5, :string

  end
end
