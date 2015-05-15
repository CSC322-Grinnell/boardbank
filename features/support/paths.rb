# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^the sign up page/
      '/users/sign_up'

    when /^the user profile page/
      @id = current_user.id
      '/profile/user/@id'

    when /^the organization profile page/
      @id = current_organization.id
      '/profile/organization/@id'

    when /^the login page/
      '/users/sign_in'

    when /^the organization login page/
      '/organizations/sign_in'

    when /^the organization sign up page/
      '/organizations/sign_up'

    when /^the admin login page/i
      '/admin/login'

    when /^the admin dashboard/i
      '/admin'

    when /^the organization admin page/i
      '/admin/organizations'

    when /^the user admin page/i
      '/admin/users'

    when /^the admin user admin page/i
      '/admin/admin_users'

    when /^the Users page/i
      '/users'

    when /^the Organizations page/i
      '/organizations'

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = Regexp.last_match(1).split(/\s+/)
        send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" \
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
