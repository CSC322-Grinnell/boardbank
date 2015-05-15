class Skill < ActiveRecord::Base
  attr_accessible :name, :skill_level

  has_many :user_skills
  has_many :users, through: :user_skills
end
