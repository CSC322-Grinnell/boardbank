class UserSkill < ActiveRecord::Base
  attr_accessible :skill_id, :experience_level
  belongs_to :user
  belongs_to :skill
end
