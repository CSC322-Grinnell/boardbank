class UserInterest < ApplicationRecord
  attr_accessible :user_interest, :interest_id, :has_interest
  belongs_to :user
  belongs_to :interest
end
