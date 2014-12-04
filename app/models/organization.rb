class Organization < ActiveRecord::Base
 devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :org_contactname, :org_address, :org_telephone, :org_city, :org_state, :org_zipcode, :orgname, :orgabout, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
