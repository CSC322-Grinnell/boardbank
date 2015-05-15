def ensure_user_created(email)
  user = AdminUser.where(email: email).first_or_create(password: 'password', password_confirmation: 'password')

  unless user.persisted?
    fail "Could not create user #{email}: #{user.errors.full_messages}"
  end
  user
end

Given /^(?:I am logged|log) out$/ do
  click_link 'Logout' if page.all(:css, 'a', text: 'Logout').any?
end

Given /^I am logged in$/ do
  step 'log out'
  login_as ensure_user_created 'admin@example.com'
end

Given /^an admin user "([^"]*)" exists$/ do |email|
  ensure_user_created(email)
end
