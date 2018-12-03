class AddExperienceToSkills < ActiveRecord::Migration[5.1]
  def change
  end

  def up
    add_column :skills, :experience, :string
  end

  def down
  end
end
