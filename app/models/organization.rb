class Organization < ActiveRecord::Base
 devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
<<<<<<< HEAD
  attr_accessible :orgname, :orgabout, :email, :password, :password_confirmation, :remember_me, :approved
=======
  attr_accessible :org_contactname, :org_address, :org_telephone, :org_city, :org_state, :org_zipcode, :orgname, :orgabout, :email, :password, :password_confirmation, :remember_me
>>>>>>> 8c0ea992e2b0cecf24d0df88e64f55f62a1730a5
  # attr_accessible :title, :body

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
end
