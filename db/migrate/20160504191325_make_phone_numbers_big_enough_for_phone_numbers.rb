class MakePhoneNumbersBigEnoughForPhoneNumbers < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :phonenumber, :integer, limit: 8
  end
end
