class Organization < ActiveRecord::Base
  
  searchkick
  
  
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :org_contactname, :approved, :org_address, :org_telephone, :org_city, :org_state, :org_zipcode, :orgname, :orgabout, :email, :password, :password_confirmation, :remember_me, :category1, :category2, :category3

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
  
  #Searchkick
  #Organization.reindex
end
