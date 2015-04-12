class RemoveInterest1FromUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.remove :interest_1
      t.remove :interest_2
    end
  end

  def down
  end
end
