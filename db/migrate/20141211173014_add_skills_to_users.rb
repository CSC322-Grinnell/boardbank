class AddSkillsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :advocacy, :string
    add_column :users, :business, :string
    add_column :users, :communications, :string
    add_column :users, :diversity, :string
    add_column :users, :finance, :string
    add_column :users, :fundraising, :string
    add_column :users, :humanresources, :string
    add_column :users, :information, :string
    add_column :users, :legal, :string
    add_column :users, :orgdevelop, :string
    add_column :users, :outcome, :string
    add_column :users, :projectmanagement, :string
    add_column :users, :training, :string
    add_column :users, :volunteer, :string

  end
end

