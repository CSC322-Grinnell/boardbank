class Organization < ActiveRecord::Base
 devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :orgname, :orgabout, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
