class Interest < ActiveRecord::Base
attr_accessible :name
has_many :user_interest
has_many :users, through: :user_interest
end
