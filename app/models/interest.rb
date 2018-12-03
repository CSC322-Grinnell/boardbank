class Interest < ApplicationRecord
  has_many :user_interest
  has_many :users, through: :user_interest
end
