class UserSkill < ApplicationRecord
  NO_EXPERIENCE = 'None'
  SOME_EXPERIENCE = 'Some'
  SIGNIFICANT_EXPERIENCE = 'Significant'
  belongs_to :user, optional: true
  belongs_to :skill, optional: true
end
