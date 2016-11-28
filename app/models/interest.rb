class Interest < ActiveRecord::Base
  attr_accessible :name, :id
  has_many :user_interest
  has_many :users, through: :user_interest
end
