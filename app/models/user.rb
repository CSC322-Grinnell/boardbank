class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :address, :city, :state, :zipcode, :phonenumber, :education, :areaofstudy,:previous_experience, :email, :password, :password_confirmation, :remember_me, :fundraise, :financial_contribution, :availability, :additional_comments, :user_interest

  has_many :user_interest
  has_many :users, through: :user_interest

 # attr_accessor :firstname

#validates_length_of :firstname, maximum: 32, message: "exceeds maximum of 32 characters"

#def fillskills
#  skills.each |name, level| do
#    {
#      if level == "No experience"
#        no_exp.add[name]
#      elsif level == "Some experience"
#        some_exp.add[name]
#      elsif level == "Significant experience"
#        sig_exp.add[name]
#      end
#    }
#    return no_exp, some_exp, sig_exp
#end

end
