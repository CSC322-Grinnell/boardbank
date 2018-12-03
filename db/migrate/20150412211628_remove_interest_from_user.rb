class RemoveInterestFromUser < ActiveRecord::Migration[5.1]
  def up
    # remove_column :users, :interest_1
    # remove_column :users, :interest_2
    # remove_column :users, :interest_3
    # remove_column :users, :interest_4
    # remove_column :users, :interest_5
    remove_column :users, :advocacy
    remove_column :users, :business
    remove_column :users, :communications
    remove_column :users, :diversity
    remove_column :users, :finance
    remove_column :users, :fundraising
    remove_column :users, :humanresources
    remove_column :users, :information
    remove_column :users, :legal
    remove_column :users, :orgdevelop
    remove_column :users, :outcome
    remove_column :users, :projectmanagement
    remove_column :users, :training
    remove_column :users, :volunteer
  end

  def down
  end
end
