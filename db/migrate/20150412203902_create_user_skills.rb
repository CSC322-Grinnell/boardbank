class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|
      t.belongs_to :user, index: true
      t.belongs_to :skill, index: true

      t.integer :user_id
      t.integer :skill_id
      t.string :experience_level

      t.timestamps
    end
  end
end
