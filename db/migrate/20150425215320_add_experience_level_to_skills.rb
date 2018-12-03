class AddExperienceLevelToSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :skill_level, :integer
  end
end
