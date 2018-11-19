class Organization < ApplicationRecord

  include Elasticsearch::Model
  searchkick


  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :contact_name, :approved, :address, :telephone, :city, :state, :zipcode, :name, :about, :email, :password, :password_confirmation, :remember_me, :category1, :category2, :category3

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
