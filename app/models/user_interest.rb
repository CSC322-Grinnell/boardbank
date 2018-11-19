class UserInterest < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :interest, optional: true
end
