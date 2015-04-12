class UserInterest < ActiveRecord::Base
  attr_accessible :user_interest
  belongs_to :user
  belongs_to :interest
end
