namespace :sqlite3_boolean do
  desc "Update booleans from 1 to true"
  task task1: :environment do
    ExampleModel.where("boolean_column = 't'").update_all(boolean_column: 1)
  end

  desc "Update booleans from 0 to false"
  task task2: :environment do
    ExampleModel.where("boolean_column = 'f'").update_all(boolean_column: 0)
  end

end
