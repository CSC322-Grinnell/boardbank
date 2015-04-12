class UserSkill < ActiveRecord::Base
   attr_accessible :name
  belongs_to :user
  belongs_to :skill
end
