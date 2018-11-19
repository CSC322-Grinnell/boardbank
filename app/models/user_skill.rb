class UserSkill < ApplicationRecord
	NO_EXPERIENCE = 'None'
	SOME_EXPERIENCE = 'Some'
	SIGNIFICANT_EXPERIENCE = 'Significant'
  attr_accessible :skill_id, :experience_level
  belongs_to :user
  belongs_to :skill
end
