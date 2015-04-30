class AddExperienceToSkills < ActiveRecord::Migration
  def change
  end

  def up
    add_column :skills, :experience, :string
  end

  def down
  end
end
