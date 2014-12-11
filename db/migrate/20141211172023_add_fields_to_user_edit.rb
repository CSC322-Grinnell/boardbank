class AddFieldsToUserEdit < ActiveRecord::Migration
  def change
  	add_column :users, :fundraise, :boolean, default: false
  	add_column :users, :financial_contribution, :boolean, default: false
  	add_column :users, :availability, :float
  	add_column :users, :additional_comments, :string
  end
end
