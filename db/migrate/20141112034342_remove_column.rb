class RemoveColumn < ActiveRecord::Migration
  def self.up
    remove_column :users, :name
    remove_column :users, :is_female
    remove_column :users, :date_of_birth
  end
end
