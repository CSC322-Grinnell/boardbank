class CreateUserInterests < ActiveRecord::Migration
  def change
    create_table :user_interests do |t|
      t.string :user_id
      t.integer :interest_id
      t.boolean :has_interest, default: false

      t.belongs_to :user, index: true
      t.belongs_to :interest, index: true

      t.timestamps
    end





  end
end
