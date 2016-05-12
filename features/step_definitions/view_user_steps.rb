Given /the following users exist/ do |user_table|
  user_table.hashes.each do |user|
    User.create!(firstname: user['FName'], lastname: user['LName'], email: user['Email'], password: user['Password'])
  	User.reindex
  	User.searchkick_index.refresh
  end
end

When(/^I attempt to view another user's profile$/) do
  user = User.create(email: "a@mail.com", password: "password")
  User.reindex
  User.searchkick_index.refresh
  visit "profile/user/#{user.id}"
end