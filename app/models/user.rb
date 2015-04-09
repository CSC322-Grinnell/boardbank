class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :address, :city, :state, :zipcode, :phonenumber, :education, :areaofstudy, :interest_1, :interest_2, :interest_3, :interest_4, :interest_5, :previous_experience, :advocacy, :business, :communications, :diversity, :finance, :fundraising, :humanresources, :information, :legal, :orgdevelop, :outcome, :projectmanagement, :training, :volunteer, :email, :password, :password_confirmation, :remember_me, :fundraise, :financial_contribution, :availability, :additional_comments


 # attr_accessor :firstname

#validates_length_of :firstname, maximum: 32, message: "exceeds maximum of 32 characters"

# collect attributes in a hash (for each |thing| do ..) then match attribute key to the value we want (some experience, significant experience) - do this in the model to avoid if statement frenzy in the view.

#  skills { "advocacy" => :advocacy,
#    "business" => :business,
#    "communications" => :communications,
#    "diversity" => :diversity,
#    "finance" => :finance,
#    "fundraising" => :fundraising,
#    "humanresources" => :humanresources,
#    "information" => :information,
#    "legal" => :legal,
#    "orgdevelop" => :orgdevelop,
#    "outcome" => :outcome,
#    "projectmanagement" => :projectmanagement,
#    "training" => :training,
#    "volunteer" => :volunteer
#  }

#  no_exp[] = null
#  some_exp[] = null
#  sig_exp[] = null

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

  # attr_accessible :title, :body
end
