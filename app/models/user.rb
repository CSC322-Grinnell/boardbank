class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :address, :city, :state, :zipcode, :phonenumber, :education, :areaofstudy, :interest_1, :interest_2, :interest_3, :interest_4, :interest_5, :previous_experience, :advocacy, :business, :communications, :diversity, :finance, :fundraising, :humanresources, :information, :legal, :orgdevelop, :outcome, :projectmanagement, :training, :volunteer, :email, :password, :password_confirmation, :remember_me, :fundraise, :financial_contribution, :availability, :additional_comments


  attr_accessor :firstname

validates_length_of :firstname, maximum: 32, message: "exceeds maximum of 32 characters"


  # attr_accessible :title, :body
end
