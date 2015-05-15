Given /the following users exist/ do |user_table|
  user_table.hashes.each do |user|
    User.create!(firstname: user['FName'], lastname: user['LName'], email: user['Email'], password: user['Password'])
  end
end
