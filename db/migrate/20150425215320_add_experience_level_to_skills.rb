class AddExperienceLevelToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :skill_level, :integer
  end
end
