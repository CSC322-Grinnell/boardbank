class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :address, :city, :state, :zipcode, :phonenumber,  :email, :password, :password_confirmation, :remember_me

validates_length_of :firstname, maximum: 32, message: "exceeds maximum of 32 characters"


  # attr_accessible :title, :body
end
